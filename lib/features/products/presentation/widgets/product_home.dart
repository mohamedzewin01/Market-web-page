import 'package:fadaalhalij/features/products/data/models/model.dart';
import 'package:fadaalhalij/features/products/presentation/widgets/products_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

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
        itemCount: 10,
        itemBuilder: (context, index) {
          ProductModel  productModel=ProductModel(
          id: 21,
          title: 'sdasdasd',
          price: 22,
          description: 'sdasadsad',
          category: 'category',
          image: 'https://artawiya.com/fadaalhalj/upLoad/image_default.jpg',
          rating:RatingModel(rate: 50, count: 10));
         List<ProductModel>productsList= List.generate(10, (index) =>productModel ,);
          return CustomProductsItem(
            product:productsList[index],
          );
        },
      ),
    );
  }
}
