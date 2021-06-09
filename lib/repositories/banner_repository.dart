import 'package:flutter/material.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';
import 'package:florist/screens/components/components.dart';

class BannerRepository extends Repository{

  Future<List<BannerDB>> getAll() async {
    var response = await httpManager.get(url: 'wp-json/wc/store/products/categories');
    List data = response;
    if(data.length > 5)
      data = data.sublist(0,5);
    List<BannerDB> results = data.map((e) {
      return BannerDB.fromJson(e);
    }).toList();
    return results;
  }

  Future<BannerDB> getOne({int Id}) async {
    var response = await httpManager.get(url: 'wp-json/wc/store/products/categories/$Id');
    var data = response;
    BannerDB results = BannerDB.fromJson(data);
    return results;
  }
}