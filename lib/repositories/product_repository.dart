// import 'package:flutter/material.dart';
// import 'package:florist/models/models.dart';
// import 'package:florist/repositories/repository.dart';
// import 'package:florist/screens/components/components.dart';
//
// class ProductRepository extends Repository{
//
//   Future<List<Product>> getRecom() async {
//     var response = await httpManager.get(url: '/api/product/recom');
//     List data = response;
//     List<Product> results = data.map((e) {
//       return Product(
//         id: e['id'],
//         name: e['name'],
//         image: e['image'],
//         model: e['model'],
//         rating: e['rating'],
//         countRate: e['count_rate'],
//         price: e['price'],
//         active: e['active'],
//       );
//     }).toList();
//     return results;
//   }
//
//   Future<List<Product>> getOfCate(int categoryId) async {
//     var response = await httpManager.get(url: '/api/product/productOfCate/$categoryId');
//     List data = response['data'];
//     List<Product> results = data.map((e) {
//       return Product(
//         id: e['id'],
//         name: e['name'],
//         image: e['image'],
//         model: e['model'],
//         rating: e['rating'],
//         countRate: e['count_rate'],
//         price: e['price'],
//         active: e['active'],
//       );
//     }).toList();
//     return results;
//   }
//
//   Future<Product> getOne({int Id}) async {
//     var response = await httpManager.get(url: '/api/product/getOne/$Id');
//     var data = response;
//
//     Product results = Product.fromJson(data);
//     return results;
//   }
// }

import 'package:flutter/material.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';
import 'package:florist/screens/components/components.dart';

class ProductRepository extends Repository{

  Future<List<Product>> getRecom() async {
    var response = await httpManager.get(url: 'wp-json/wc/store/products');
    List data = response;
    if(data.length > 10)
      data = data.sublist(0,10);
    List<Product> results = data.map((e) {
      return Product.fromJson(e);
    }).toList();
    return results;
  }

  Future<List<Product>> getOfCate(int categoryId) async {
    var response = await httpManager.get(url: '/api/product/productOfCate/$categoryId');
    List data = response['products'];
    List<Product> results = data.map((e) {
      return Product.fromJson(e);
    }).toList();
    return results;
  }

  Future<Product> getOne({int Id}) async {
    var response = await httpManager.get(url: 'wp-json/wc/store/products/$Id');
    var data = response;
    Product results = Product.fromJson(data);
    return results;
  }
}
