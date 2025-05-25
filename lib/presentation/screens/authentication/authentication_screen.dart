import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khazana/presentation/screens/authentication/authentication_widgets/welcome_widget.dart';
import '../../../cubits/auth/auth_cubit.dart';
import 'authentication_widgets/login_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  static const String route = '/authentication';
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  int currentPageIndex = 0;
  void callback(int changeIndexTo) {
    setState(() {
      currentPageIndex = changeIndexTo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return IndexedStack(index: currentPageIndex, children: [WelcomeScreen(callback: () => callback(1)), LoginWidget()]);
          },
        ),
      ),
    );
  }
}
