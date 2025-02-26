import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fadaalhalij/core/widgets/custom_riyal_saudi.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../generated/assets.dart';
import '../../domain/products_entities/products_entities.dart';
import 'custom_app_bar.dart';
import 'custom_background.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductsEntity product;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      assetsImagePng: Assets.imagesDeliveryGoodsBlueSurface,
      body: ListView(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      title: product.productName,
                      color: Colors.white,
                      onTap: () => Navigator.pop(context),
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorManager.primary.withAlpha(150),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${ApiConstants.baseUrlImage}${product.imageCover}",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Skeletonizer(
                                              child: Image.asset(
                                    Assets.assetsImagesImageDefault,
                                  )),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    Assets.assetsImagesImageDefault,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            product.description ?? '',
                            style: getSemiBoldStyle(
                                color: ColorManager.white, fontSize: 24),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 6),
                            margin: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: ColorManager.white),
                                color: ColorManager.white),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomRiyalSaudi(size: 24),
                                Text(
                                  product.productpriceAfterDiscount
                                          .toString() ??
                                      '',
                                  style: getSemiBoldStyle(
                                      color: ColorManager.error, fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        color: ColorManager.yellow,
                        child: Center(
                            child: Text(
                          'تموينات فضاء الخيلج - الارطاوية ',
                          style: getBoldStyle(color: ColorManager.error),
                        ))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
