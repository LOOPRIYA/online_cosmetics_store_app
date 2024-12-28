import 'package:online_cosmetics_store_app/core/data/repositories/home_repository.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/category_entity.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';

import '../../../../core/domain/entities/banner_entity.dart';

class HomeData {
  final List<BannerEntity> banners;
  final List<CategoryEntity> categories;
  final List<ProductEntity> newProducts;
  final List<ProductEntity> saleProducts;
  final List<ProductEntity> popularProducts;

  HomeData(
      {required this.banners,
      required this.categories,
      required this.newProducts,
      required this.saleProducts,
      required this.popularProducts});
}

class GetHomeDataUseCase {
  final HomeRepository homeRepository;

  GetHomeDataUseCase({required this.homeRepository});

  Future<HomeData> call() async {
    final banners = await homeRepository.getBanners();
    final categories = await homeRepository.getCategories();
    final newProducts = await homeRepository.getNewProducts();
    final saleProducts = await homeRepository.getSaleProducts();
    final popularProducts = await homeRepository.getPopularProducts();
    return HomeData(
        banners: banners,
        categories: categories,
        newProducts: newProducts,
        saleProducts: saleProducts,
        popularProducts: popularProducts);
  }
}
