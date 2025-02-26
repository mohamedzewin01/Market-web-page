import 'package:fadaalhalij/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_riyal_saudi.dart';

class SkeletonHome extends StatelessWidget {
  const SkeletonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 6 / 9),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.placeHolderColor),
                  borderRadius: BorderRadius.circular(0)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        decoration: const BoxDecoration(
                            // color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(Assets.assetsImagesImageDefault),
                        )),
                  ),
                  Column(
                    children: [
                      Text(
                        'product.productName ',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            color: ColorManager.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'product.description ',
                                textDirection: TextDirection.rtl,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: ColorManager.primary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Divider(),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
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
                                  '55',
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
                            ),
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
                                  '65',
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
            );
          }),
    );
  }
}
