import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final supabase = Supabase.instance.client;
  bool isOtpScreen = false;
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  void checkAuthStatus() async {
    emit(AuthLoading());
    final user = Supabase.instance.client.auth.currentUser;
    print("Current User: $user");
    if (user != null) {
      emit(AuthSessionExists());
    } else {
      print("Error checking auth status: 1");
      emit(AuthSessionDoesNotExists());
    }
  }

  Future<void> sendOTP(String phone) async {
    if (phone.length != 10) {
      emit(AuthError("Invalid phone number"));
      return;
    }
    isOtpScreen = true;
    emit(AuthLoading());
    try {
      await supabase.auth.signInWithOtp(phone: "+91$phone", shouldCreateUser: true);
      emit(AuthCodeSent());
    } catch (e) {
      print("Error sending OTP: $e");
      emit(AuthError("Failed to send OTP"));
    }
  }

  Future<void> verifyOTP(String otp, String phone) async {
    emit(AuthLoading());
    try {
      final res = await supabase.auth.verifyOTP(type: OtpType.sms, phone: "+91$phone", token: otp);
      print("OTP verification response: $res");
      if (res.user != null) {
        emit(AuthLoggedIn());
      }
    } catch (e) {
      emit(AuthError("Invalid OTP"));
      switchToVerifyCodeWidget();
    }
  }

  // Future<void> checkIfUserExists(String phone) async {
  //   emit(AuthLoading());
  //   try {
  //     // userData = await _authRepository.login(phone);
  //     // emit(AuthLoggedIn(userData ?? UserModel()));
  //   } on ApiException catch (e) {
  //     emit(AuthError(e.message));
  //   }
  // }

  void switchToPhonLoginWidget() {
    isOtpScreen = false;
    emit(AuthInitial());
  }

  void switchToVerifyCodeWidget() {
    isOtpScreen = true;
    emit(AuthCodeSent());
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await supabase.auth.signOut();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthError("Logout failed"));
    }
  }
}
