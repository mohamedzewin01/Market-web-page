import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../domain/products_entities/products_entities.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    required this.product,
  });

  final ProductsEntity product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.orange),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child:
                        CachedNetworkImage(
                          imageUrl:
                              'https://artawiya.com/fadaalhalj/api/v1/upload/${product.imageCover}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ))
                ),
              ),
              Padding(

                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.productName ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: ColorManager.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Text(
                      product.description ?? '',
                      style: const TextStyle(
                        color: ColorManager.orange,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'ريال',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: ColorManager.primary),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              product.productpriceAfterDiscount.toString() ??
                                  '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: ColorManager.primary),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                product.productprice.toString() ?? '',
                                style: const TextStyle(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: ColorManager.primary,
                                  decorationThickness: 2,
                                ),
                              ),
                              const Text('EGP',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.primary,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: ColorManager.primary,
                                    decorationThickness: 2,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.blueAccent,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
