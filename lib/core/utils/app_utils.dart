import 'package:online_cosmetics_store_app/core/data/data_sources/local/app_data_source.dart';
import 'package:online_cosmetics_store_app/core/data/repositories/app_repository.dart';
import 'package:online_cosmetics_store_app/core/data/repositories/home_repository.dart';
import 'package:online_cosmetics_store_app/core/domain/repositories/app_reopository.dart';
import 'package:online_cosmetics_store_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:online_cosmetics_store_app/core/data/repositories/products_repository.dart';
import 'package:online_cosmetics_store_app/features/home/data/repositories/products_repository_impl.dart';

class AppUtils {
  static AppRepository getAppRepository() {
    return AppRepositoryImpl(localDataSource: AppDataSource());
  }

  static HomeRepository getHomeRepository() {
    return HomeRepositoryImpl(appRepository: getAppRepository());
  }

  static ProductsRepository getProductsRepository() {
    return ProductsRepositoryImpl(appRepository: getAppRepository());
  }
}
