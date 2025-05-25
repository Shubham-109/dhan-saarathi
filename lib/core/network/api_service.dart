// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../index.dart';

class ApiService {
  late String token;
  final int timeoutInSeconds = 30;
  final String baseUrl = Url.baseUrl;
  late Map<String, String> _mainHeaders;
  final SharedPreferences sharedPreferences;

  ApiService({required this.sharedPreferences}) {
    updateHeader();
  }

  void updateHeader() {
    Map<String, String> header = {};
    header.addAll({'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'});
    _mainHeaders = header;
  }

  Future<dynamic> getRequest(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: headers ?? _mainHeaders).timeout(Duration(seconds: timeoutInSeconds));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    try {
      final response = await http
          .post(Uri.parse('$baseUrl/$endpoint'), headers: headers ?? _mainHeaders, body: json.encode(body))
          .timeout(Duration(seconds: timeoutInSeconds));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> postFormData(
    String endpoint,
    Map<String, dynamic> data, {
    String fileFieldOne = "files",
    String fileFieldTwo = "files",
    List<String>? filePathsOne,
    List<String>? filePathsTwo,
    Map<String, String>? headers,
  }) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse('$baseUrl/$endpoint'));
      request.headers.addAll(headers ?? _mainHeaders);
      data.forEach((key, value) {
        if (value != null) request.fields[key] = value;
      });
      if (filePathsOne != null) {
        for (String path in filePathsOne) {
          request.files.add(await http.MultipartFile.fromPath(fileFieldOne, path));
        }
      }
      if (filePathsTwo != null) {
        for (String path in filePathsTwo) {
          request.files.add(await http.MultipartFile.fromPath(fileFieldTwo, path));
        }
      }
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse).timeout(Duration(seconds: timeoutInSeconds));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleResponse(http.Response response) {
    final decodedBody = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decodedBody;
    } else {
      throw ApiException(response.statusCode, decodedBody['error'] ?? 'Unknown error');
    }
  }

  dynamic _handleError(dynamic e) {
    if (e is TimeoutException) {
      throw ApiException(0, 'Request timed out');
    } else if (e is http.ClientException) {
      throw ApiException(0, 'No internet connection');
    } else if (e is ApiException) {
      throw ApiException(0, e.message);
    } else {
      throw ApiException(0, 'Unexpected error occurred');
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;
  ApiException(this.statusCode, this.message);
}
