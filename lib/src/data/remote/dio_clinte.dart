import 'package:dio/dio.dart';
import 'package:jumpapp/src/data/remote/logger_interceptor.dart';
class DioClient{



  final _dio = Dio();
  Dio create(){

    _dio.interceptors.add(LoggerInterceptor());
    return _dio;
  }
}