import 'package:cached_network_image/cached_network_image.dart';
import 'package:fadaalhalij/core/widgets/custom_riyal_saudi.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../generated/assets.dart';
import '../../data/models/StoreModelResponse.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final BestDeals product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offwhite.withAlpha(250),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          product.productName ?? '',
          maxLines: 1,
          style: getSemiBoldStyle(color: ColorManager.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorManager.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                        aspectRatio: 8 / 9,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiConstants.baseUrlImage}${product.imageCover}",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Skeletonizer(
                                  child: Image.asset(
                            Assets.assetsImagesImageDefault,
                          )),
                          errorWidget: (context, url, error) => Image.asset(
                            Assets.assetsImagesImageDefault,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ColorManager.primaryColor.withAlpha(100),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      product.description ?? '',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
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
                          product.productPriceAfterDiscount.toString() ?? '',
                          style: getSemiBoldStyle(
                              color: ColorManager.error, fontSize: 26),
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
    );
  }
}
