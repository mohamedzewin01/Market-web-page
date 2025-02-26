import 'package:cached_network_image/cached_network_image.dart';
import 'package:fadaalhalij/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_riyal_saudi.dart';
import '../../domain/products_entities/products_entities.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    required this.product,
    this.onTap,
  });

  final ProductsEntity product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorManager.placeHolderColor),
                borderRadius: BorderRadius.circular(0)),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiConstants.baseUrlImage}${product.imageCover}',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Skeletonizer(
                                child: Image.asset(
                          Assets.assetsImagesImageDefault,
                        )),
                        errorWidget: (context, url, error) => Image.asset(
                          Assets.assetsImagesImageDefault,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                // Divider(),
                Column(
                  children: [
                    Text(
                      product.productName ?? '',
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.roboto(
                          color: ColorManager.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              product.description ?? '',
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: ColorManager.primary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorManager.placeHolderColor,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          product.productpriceAfterDiscount != 0
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CustomRiyalSaudi(
                                      color: ColorManager.primary,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      product.productprice.toString(),
                                      style: const TextStyle(
                                        color: ColorManager.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: ColorManager.primary,
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          VerticalDivider(
                            color: ColorManager.placeHolderColor,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomRiyalSaudi(),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                product.productpriceAfterDiscount.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: ColorManager.error),
                              ),
                            ],
                          ),
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
    );
  }
}


