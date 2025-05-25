import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khazana/cubits/auth/auth_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/index.dart';
import '../../dashboard/dashboard_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCodeSent) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP sent to ${phoneController.text}')));
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthInitial) {
          otpController.clear();
        } else if (state is AuthLoggedIn) {
          Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.route, (route) => false);
        }
      },
      builder: (context, state) {
        final bool showOtp = context.read<AuthCubit>().isOtpScreen;
        return Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                style: TextStyles.textStyle_28_400.copyWith(fontSize: showOtp ? 30 : 25, color: Theme.of(context).colorScheme.onPrimary),
                child: Text('Welcome Back,\nWe Missed You! 🎉'),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Glad to have you back at ', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                  ShaderMask(
                    shaderCallback:
                        (bounds) => const LinearGradient(
                          colors: [Color(0xFF0883FD), Color(0xFF8CD1FB)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: Text('Dhan Saarthi', style: TextStyles.textStyle_14_400.copyWith(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 85),
              if (!showOtp) ...[
                Text('Enter your phone number', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                const SizedBox(height: 12),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: TextStyles.textStyle_14_300.copyWith(color: Theme.of(context).colorScheme.onPrimary, letterSpacing: 1.2),
                  maxLength: 10,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      width: 70,
                      child: Text(
                        '+91',
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyle_14_500.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    hintText: 'Enter number',
                    counter: SizedBox(),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
              ] else ...[
                Text('Enter OTP', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                const SizedBox(height: 16),
                Pinput(
                  controller: otpController,
                  length: 6,
                  separatorBuilder: (index) => Spacer(),
                  followingPinTheme: PinTheme(
                    width: MediaQuery.sizeOf(context).width * .1,
                    height: MediaQuery.sizeOf(context).width * .12,
                    textStyle: const TextStyle(color: Colors.white, fontSize: 18),

                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onSecondary, width: 3))),
                  ),
                  defaultPinTheme: PinTheme(
                    width: MediaQuery.sizeOf(context).width * .1,
                    height: MediaQuery.sizeOf(context).width * .12,
                    textStyle: const TextStyle(color: Colors.white, fontSize: 18),

                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).primaryColor, width: 3))),
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    Text("Didn't Receive OTP?", style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                    SizedBox(width: 6),
                    Text("Resend", style: TextStyles.textStyle_12_400.copyWith(color: Theme.of(context).primaryColor)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "OTP has been sent on ${phoneController.length != 10 ? '' : phoneController.text.replaceRange(3, 8, "*****")}",
                      style: TextStyles.textStyle_12_400,
                    ),
                    const SizedBox(width: 3),
                    GestureDetector(
                      onTap: () {
                        context.read<AuthCubit>().switchToPhonLoginWidget();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.edit, color: Theme.of(context).colorScheme.onSecondary, size: 17),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.center,
                child:
                    state is AuthLoading
                        ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onSecondary)
                        : FilledButton(
                          onPressed: () {
                            if (!showOtp) {
                              context.read<AuthCubit>().sendOTP(phoneController.text);
                            } else {
                              context.read<AuthCubit>().verifyOTP(otpController.text, phoneController.text);
                            }
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            disabledBackgroundColor: Theme.of(context).colorScheme.onSecondary.withAlpha(100),
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                          ),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * .7,
                            height: 45,
                            child: Center(
                              child: Text('Proceed', style: TextStyles.textStyle_14_400.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                            ),
                          ),
                        ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'By signing in, you agree to our ',
                      style: TextStyles.textStyle_11_400.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      children: [
                        TextSpan(text: ' T&C ', style: TextStyles.textStyle_11_400.copyWith(color: Theme.of(context).primaryColor)),
                        TextSpan(text: ' and '),
                        TextSpan(text: ' Privacy Policy', style: TextStyles.textStyle_11_400.copyWith(color: Theme.of(context).primaryColor)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
