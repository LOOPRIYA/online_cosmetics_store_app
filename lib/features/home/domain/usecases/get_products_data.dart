import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';
import 'package:online_cosmetics_store_app/core/data/repositories/products_repository.dart';

class ProductsData {
  final List<ProductEntity> products;

  ProductsData({
    required this.products,
  });
}

class GetProductsData {
  final ProductsRepository productsRepository;

  GetProductsData({required this.productsRepository});

  Future<ProductsData> call() async {
    final products = await productsRepository.getProducts();

    return ProductsData(
      products: products,
    );
  }
}
