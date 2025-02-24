import 'package:fadaalhalij/features/products/presentation/widgets/products_items.dart';
import 'package:flutter/material.dart';

import '../../domain/products_entities/products_entities.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.productsList,
  });

  final List<ProductsEntity> productsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 6 / 9),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          return CustomProductsItem(
            product:productsList[index],
          );
        },
      ),
    );
  }
}
