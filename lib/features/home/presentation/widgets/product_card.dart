import 'package:flutter/material.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        final imageHeight = cardWidth * 1.2;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color(0xffF4F4F4),
                  width: cardWidth,
                  height: imageHeight,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Image not found'));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(product.name,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)),
              const SizedBox(height: 4),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(product.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis)),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(_formatPrice(product.price),
                        style: Theme.of(context).textTheme.titleLarge),
                    if (product.oldPrice != null) const SizedBox(width: 5),
                    if (product.oldPrice != null)
                      Text(_formatPrice(product.oldPrice!),
                          style: Theme.of(context).textTheme.labelSmall)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatPrice(double price) {
    String priceString = price.toStringAsFixed(0);
    if (price < 10000) {
      return '$priceString ₽';
    }
    String formattedPrice = '';
    int count = 0;

    for (int i = priceString.length - 1; i >= 0; i--) {
      formattedPrice = priceString[i] + formattedPrice;
      count++;
      if (count == 3 && i != 0) {
        formattedPrice = ' $formattedPrice';
        count = 0;
      }
    }
    return '$formattedPrice ₽';
  }
}
