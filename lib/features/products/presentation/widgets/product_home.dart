import 'package:fadaalhalij/core/resources/color_manager.dart';
import 'package:fadaalhalij/core/resources/style_manager.dart';
import 'package:fadaalhalij/features/products/presentation/widgets/product_details.dart';
import 'package:fadaalhalij/features/products/presentation/widgets/products_items.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/StoreModelResponse.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.productsList,
  });

  final List<BestDeals> productsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: productsList.isEmpty
          ? Center(
              child: Text(
                'لا يوجد منتجات',
                style:
                    getSemiBoldStyle(color: ColorManager.black, fontSize: 20),
              ),
            )
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  mainAxisExtent: 240),
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return

                    // ProductCardWidget(product: productsList[index]);

                    CustomProductsItem(
                  product: productsList[index],
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          ProductDetails(product: productsList[index]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
