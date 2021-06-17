import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class MemberRepository extends Repository {
  Future<Member> getOne() async {
    var response = await httpManager.get(url: 'wp-json/wp/v2/users/me');
    Member results = Member.fromJson(response);
    await SharedPrefs.setMemberId(results.id);
    await SharedPrefs.setAvatar(results.avatarUrls.s96);
    return results;
  }

  Future<int> memberRegister({String name, String email, String pass}) async {
    FormData formData = FormData.fromMap({
      'username': name,
      'email': email,
      'password': pass,
    });
    var response = await httpManager.post(
      url: 'wp-content/themes/porto/api/register.php',
      data: formData,
    );
    Map responseMap = jsonDecode(response);
    int status = responseMap['code'] ?? responseMap['status'];
    return status;
  }

  Future<Map> forgotPass({String email}) async {
    var response = await httpManager.post(url: '/api/member/forgotPass', data: {
      'email': email,
    });
    String code = response['code'] ?? 'error';
    int id = response['id'] ?? 0;
    Map results = {
      'id': id,
      'code': code,
    };

    return results;
  }

  Future<Map> checkExist({String email, String phone}) async {
    var response = await httpManager.post(url: '/api/member/checkExist', data: {
      'email': email,
      'phone': phone,
    });

    String statusEmail = response['status_email'];
    String statusPhone = response['status_phone'];
    Map results = {
      'status_email': statusEmail,
      'status_phone': statusPhone,
    };

    return results;
  }

  Future<int> resetPass({int id, String pass}) async {
    await httpManager.put(url: '/api/member/resetPass/$id', data: {
      'pass': pass,
    });
    return 1;
  }
}
