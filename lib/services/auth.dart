import 'package:dio/dio.dart' as Dio;
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:flutter/material.dart';

import 'dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  Member _member;

  bool get authenticated => _isLoggedIn;

  Member get member => _member;

  Future<String> login({Map creds}) async {
   /* try {
      Dio.Response response = await dio().post('wp-json/jwt-auth/v1/token', data: creds);
      String token = response.data['token'];
      int wishlist_id = response.data['wishlist_id'];
      int bag_id = response.data['bag'];
      Member member = Member.fromJson(response.data['member']);
      await SharedPrefs.setToken(token);
      await SharedPrefs.setMemberId(member.id);
      await SharedPrefs.setWishlistId(wishlist_id);
      await SharedPrefs.setBagId(bag_id);
      await SharedPrefs.setAvatar(Globals().urlImage + member.avatar);
      await SharedPrefs.setRememberMe(creds['remember_me']);
      return token;
    } catch (e) {
      print(e);
    } */
    try {
      Dio.Response response = await dio().post('wp-json/jwt-auth/v1/token', data: creds);
      String token = response.data['token'];
      String email = response.data['user_email'];

      await SharedPrefs.setToken(token);
      await SharedPrefs.setEmail(email);

      await SharedPrefs.setRememberMe(creds['remember_me']);
      return token;
    } catch (e) {
      print(e);
    }
    return '';
  }

  Future<String> loginExternal({Map creds}) async {

    try {
      Dio.Response response = await dio().post('/login-external', data: creds);
      String token = response.data['token'];
      // int wishlist_id = response.data['wishlist_id'];
      // int bag_id = response.data['bag'];
      // Member member = Member.fromJson(response.data['member']);
      await SharedPrefs.setToken(token);
      // await SharedPrefs.setMemberId(member.id);
      // await SharedPrefs.setWishlistId(wishlist_id);
      // await SharedPrefs.setBagId(bag_id);
      // await SharedPrefs.setAvatar(Globals().urlImage + member.avatar);
      await SharedPrefs.setRememberMe(true);
      return token;
    } catch (e) {
      throw e;
    }
  }

  void logout() {
    _isLoggedIn = false;

    notifyListeners();
  }
}
