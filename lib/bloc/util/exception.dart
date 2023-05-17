import 'package:dio/dio.dart';

class ExceptionParser {
  static const String _defaultMessage = "Something went wrong";

  static String parseNetworkException(Exception e) {
    if (e is DioError) {
      return e.response?.data is Map
          ? e.response?.data['msg'] ?? _defaultMessage
          : _defaultMessage;
    } else {
      return _defaultMessage;
    }
  }
}