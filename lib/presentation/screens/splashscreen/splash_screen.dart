import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../widgets/index.dart';
import '../authentication/authentication_screen.dart';
import '../dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      context.read<AuthCubit>().checkAuthStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSessionExists) {
          Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.route, (route) => false);
        }
        if (state is AuthSessionDoesNotExists) {
          print("No session exists, navigating to authentication screen");
          Navigator.pushNamedAndRemoveUntil(context, AuthenticationScreen.route, (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(body: AppLogoWidget(width: MediaQuery.sizeOf(context).width * .3));
      },
    );
  }
}
