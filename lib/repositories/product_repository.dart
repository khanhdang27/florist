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

import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class ProductRepository extends Repository {
  Future<List<Product>> getRecom() async {
    var response = await httpManager.get(url: 'wp-json/wc/store/products');
    List data = response;
    if (data.length > 10) data = data.sublist(0, 10);
    List<Product> results = data.map((e) {
      return Product.fromJson(e);
    }).toList();
    return results;
  }

  Future<List<Product>> getAll() async {
    List response = await httpManager.get(url: 'wp-json/wc/store/products');
    List<Product> results = response.map((e) {
      return Product.fromJson(e);
    }).toList();
    return results;
  }

  Future<List<ProductList>> getOfCate(int categoryId) async {
    // var response = await httpManager.get(url: '/api/product/productOfCate/$categoryId');
    var response = await httpManager.get(baseUrl: AppConfig().appUrlDidili, params: {
      'action': 'get-cat-product-list',
      'term_id': '$categoryId',
    });
    List dataTemp = response['data'][0]['product_list'];
    List<ProductList> results = dataTemp.map((e) {
      return ProductList.fromJson(e);
    }).toList();
    return results;
  }

  Future<Product> getOne({int id}) async {
    var response = await httpManager.get(url: 'wp-json/wc/store/products/$id');
    var data = response;
    Product results = Product.fromJson(data);
    return results;
  }
}
