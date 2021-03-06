
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRequest{
  final String url;
  final Map data;

  ApiRequest({@required this.url, this.data});

  Dio _dio() {
    return Dio(BaseOptions(headers: {
      'Authorization': 'Bearer \$token',
    }));
  }

  void get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }){
    _dio().get(this.url, queryParameters: this.data).then((res){
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error){
      if (onError != null) onError(error);
    });
  }
}

