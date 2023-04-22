import 'package:dio/dio.dart';

const baseUrl = 'http://87.107.146.132:8050/';

final options = BaseOptions(
  baseUrl: baseUrl,
  validateStatus: (status) => true,
  connectTimeout: const Duration(seconds: 50),
  receiveTimeout: const Duration(seconds: 50),
  contentType: 'application/json',
  headers: {
    "Authorization": "Token 33b6007568d19f5707954d33efb2d141a85d175d",
  },
);

final dio = Dio(options);
