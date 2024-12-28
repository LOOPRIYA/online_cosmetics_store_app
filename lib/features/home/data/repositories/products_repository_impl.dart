import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';

import '../../../../core/data/repositories/products_repository.dart';
import '../../../../core/domain/repositories/app_reopository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final AppRepository appRepository;

  ProductsRepositoryImpl({required this.appRepository});

  @override
  Future<List<ProductEntity>> getProducts() {
    throw UnimplementedError();
  }
}
