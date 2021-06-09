import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());
  final ProductRepository productRepository = ProductRepository();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductReset) {
      yield ProductInitial();
    }

    if (event is ProductGetRecom) {
      List<Product> products = await productRepository.getRecom();
      if (true) {
        yield ProductGetRecomSuccess(
          items: products,
        );
      } else {
        yield ProductGetRecomFailed();
      }
    }

    if (event is ProductGetOfCate) {
      List<Product> products = await productRepository.getOfCate(event.categoryId);

      if (true) {
        /// filter by range price
        if (event.minPrice != null) {
          products.removeWhere(
              (element) => double.parse(element.prices.price) < event.minPrice);
          products.removeWhere(
              (element) => double.parse(element.prices.price) > event.maxPrice);
        }
        ///filter by price, count Review, score
        switch (event.sort) {
          case 'price_d':
            {
              products.sort((b, a) => a.prices.price.compareTo(b.prices.price));
            }
            break;
          case 'leaveComment':
            {
              products.sort((a, b) => a.reviewCount.compareTo(b.reviewCount));
            }
            break;
          case 'leaveComment_d':
            {
              products.sort((b, a) => a.reviewCount.compareTo(b.reviewCount));
            }
            break;
          case 'score':
            {
              products.sort((a, b) =>
                  double.parse(a.averageRating)
                      .compareTo(double.parse(b.averageRating)));
            }
            break;
          case 'score_d':
            {
              products.sort((b, a) =>
                  double.parse(a.averageRating)
                      .compareTo(double.parse(b.averageRating)));
            }
            break;
          default:
            {
              products.sort((a, b) => a.prices.price.compareTo(b.prices.price));
            }
            break;
        }
        yield ProductGetOfCateSuccess(
          items: products,
        );
      } else {
        yield ProductGetOfCateFailed();
      }
    }
    if (event is ProductGetOne) {
      Product product = await productRepository.getOne(Id: event.Id);
      if (true) {
        yield ProductGetOneSuccess(
          item: product,
        );
      } else {
        yield ProductGetOneFailed();
      }
    }
  }
}
