
import 'package:online_cosmetics_store_app/core/domain/entities/category_entity.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';

import '../../domain/entities/banner_entity.dart';

abstract class HomeRepository {
  Future<List<BannerEntity>> getBanners();
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getNewProducts();
  Future<List<ProductEntity>> getSaleProducts();
  Future<List<ProductEntity>> getPopularProducts();

}