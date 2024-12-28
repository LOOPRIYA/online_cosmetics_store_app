import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProducts();


}



