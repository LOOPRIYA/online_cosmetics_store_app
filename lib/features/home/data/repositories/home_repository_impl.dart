import 'package:online_cosmetics_store_app/core/data/repositories/home_repository.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/category_entity.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';
import 'package:online_cosmetics_store_app/core/domain/repositories/app_reopository.dart';

import '../../../../core/domain/entities/banner_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final AppRepository appRepository;

  HomeRepositoryImpl({required this.appRepository});

  @override
  Future<List<BannerEntity>> getBanners() async {
    return await appRepository.getBanners();
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await appRepository.getCategories();
  }

  @override
  Future<List<ProductEntity>> getNewProducts() async {
    return await appRepository.getNewProducts();
  }

  @override
  Future<List<ProductEntity>> getSaleProducts() async {
    return await appRepository.getSaleProducts();
  }

  @override
  Future<List<ProductEntity>> getPopularProducts() async {
    return await appRepository.getPopularProducts();
  }
}
