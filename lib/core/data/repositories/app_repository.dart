import 'package:online_cosmetics_store_app/core/data/data_sources/local/app_data_source.dart';

import 'package:online_cosmetics_store_app/core/domain/entities/category_entity.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';
import 'package:online_cosmetics_store_app/core/domain/repositories/app_reopository.dart';

import '../../domain/entities/banner_entity.dart';

class AppRepositoryImpl implements AppRepository {
  final AppDataSource localDataSource;

  AppRepositoryImpl({required this.localDataSource});

  @override
  Future<List<BannerEntity>> getBanners() async {
    final models = await localDataSource.getBanners();
    return models
        .map((e) => BannerEntity(id: e.id ?? '', imageUrl: e.imageUrl ?? ''))
        .toList();
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final models = await localDataSource.getCategories();
    return models
        .map((e) => CategoryEntity(
            id: e.id ?? '', name: e.name ?? '', imageUrl: e.imageUrl ?? ''))
        .toList();
  }

  @override
  Future<List<ProductEntity>> getNewProducts() async {
    final models = await localDataSource.getNewProducts();
    return models
        .map((e) => ProductEntity(
              id: e.id ?? '',
              name: e.name ?? '',
              description: e.description ?? '',
              price: e.price ?? 0.0,
              oldPrice: e.oldPrice,
              imageUrl: e.imageUrl ?? '',
            ))
        .toList();
  }

  @override
  Future<List<ProductEntity>> getSaleProducts() async {
    final models = await localDataSource.getSaleProducts();
    return models
        .map((e) => ProductEntity(
              id: e.id ?? '',
              name: e.name ?? '',
              description: e.description ?? '',
              price: e.price ?? 0.0,
              oldPrice: e.oldPrice,
              imageUrl: e.imageUrl ?? '',
            ))
        .toList();
  }

  @override
  Future<List<ProductEntity>> getPopularProducts() async {
    final models = await localDataSource.getPopularProducts();
    return models
        .map((e) => ProductEntity(
              id: e.id ?? '',
              name: e.name ?? '',
              description: e.description ?? '',
              price: e.price ?? 0.0,
              oldPrice: e.oldPrice,
              imageUrl: e.imageUrl ?? '',
            ))
        .toList();
  }
}
