import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:online_cosmetics_store_app/core/data/models/banner_model.dart';
import 'package:online_cosmetics_store_app/core/data/models/category_model.dart';
import 'package:online_cosmetics_store_app/core/data/models/product_model.dart';

class AppDataSource {
  Future<List<BannerModel>> getBanners() async {
    final String response =
        await rootBundle.loadString('assets/data/banners.json');
    final data = json.decode(response) as List;
    return data.map((e) => BannerModel.fromJson(e)).toList();
  }

  Future<List<CategoryModel>> getCategories() async {
    final String response =
        await rootBundle.loadString('assets/data/categories.json');
    final data = json.decode(response) as List;
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> getNewProducts() async {
    final String response =
        await rootBundle.loadString('assets/data/new_products.json');
    final data = json.decode(response) as List;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> getSaleProducts() async {
    final String response =
        await rootBundle.loadString('assets/data/sale_products.json');
    final data = json.decode(response) as List;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> getPopularProducts() async {
    final String response =
        await rootBundle.loadString('assets/data/popular_products.json');
    final data = json.decode(response) as List;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> loadProducts() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
