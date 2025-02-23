import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../data/models/model.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    double oldPrice = product.price + 15;

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
                        // Image.network( 'https://artawiya.com/fadaalhalj/upLoad/image_default.png'),

                        CachedNetworkImage(
                            imageUrl:
                                'https://fitness.elevateegy.com/uploads/default-profile.png',
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        )
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: ColorManager.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Text(
                      product.description,
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
                              'EGP',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: ColorManager.primary),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              product.price.toString(),
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
                                oldPrice.toStringAsFixed(2),
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
                    Row(
                      children: [
                        const Text(
                          'Review',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(product.rating.rate.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.star,
                          color: ColorManager.primary,
                          size: 20,
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
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
