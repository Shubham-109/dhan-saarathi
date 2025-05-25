// ignore_for_file: unused_field

import '../../core/network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiService _apiService;
  final SharedPreferences _sharedPreferences;
  AuthRepository({required apiService, required SharedPreferences sharedPreferences})
    : _apiService = apiService,
      _sharedPreferences = sharedPreferences;
}
