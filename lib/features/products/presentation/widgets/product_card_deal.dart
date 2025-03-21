import 'package:fadaalhalij/core/resources/color_manager.dart';
import 'package:fadaalhalij/core/resources/style_manager.dart';
import 'package:fadaalhalij/core/widgets/custom_riyal_saudi.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/cashed_image.dart';
import '../../data/models/StoreModelResponse.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.product, this.onTap});

  final BestDeals product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        // onTap: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ProductDetailScreen(product: product),
        //     )),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffF1F1F5)),
              borderRadius: BorderRadius.circular(8)),
          width: (MediaQuery.of(context).size.width / 2) - 34,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomImage(
                    url: product.imageCover ?? '',
                    width: 120,
                    height: 120,
                  ),
                  Container(
                    // alignment: Alignment.center,
                    child: Row(
                      children: [
                        CustomRiyalSaudi(),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          product.productPriceAfterDiscount.toString(),
                          style: TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomRiyalSaudi(
                        color: ColorManager.black,
                        size: 10,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        product.productPrice.toString(),
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: ColorManager.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      // Text(
                      //   "${product.descount}%",
                      //   style: TextStyle(
                      //       color: Color.fromARGB(255, 27, 133, 185),
                      //       fontSize: 10,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                  Divider(),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          product.productName ?? "????",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textDirection: TextDirection.rtl,
                          style: getSemiBoldStyle(
                              color: ColorManager.orange, fontSize: 16),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            product.description ?? "????",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                            style: getSemiBoldStyle(
                                color: ColorManager.orange, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 48,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
              ),
            ),
            Positioned(
              top: 0, // to shift little up
              left: 0,
              child: Container(
                  decoration: BoxDecoration(
                      color: ColorManager.error,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(8))),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text("${product.descount}%",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white)),
                      Text("خصم",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white))
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
