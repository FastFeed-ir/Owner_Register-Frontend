import 'package:dio/dio.dart';

const baseUrl = 'http://87.107.146.132:8050/';

var options = BaseOptions(
  baseUrl: baseUrl,
  validateStatus: (status) => true,
  connectTimeout: const Duration(seconds: 50),
  receiveTimeout: const Duration(seconds: 50),
  contentType: 'application/json',
  headers: {
    "Authorization": "Token a9fdf10516ea0d626f84408a4f032c890648cdea",
  },
);
