import 'package:dio/dio.dart';

Dio dio(){
  Dio dio = new Dio();

  //ios
  //dio.options.baseUrl = "http://localhost:8000/api";
  //android
 //  dio.options.baseUrl = "http://10.0.2.2:8000/api";
 //  dio.options.baseUrl = "http://nirondemo.tk/florist/public/api";
  dio.options.baseUrl = "https://hkdemo.xunchaokeji.com/";

  dio.options.headers['accept'] = 'Application/Json';

  return dio;
}