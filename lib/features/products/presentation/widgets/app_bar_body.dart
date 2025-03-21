import 'dart:developer';

import 'package:fadaalhalij/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../data/models/StoreModelResponse.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({
    super.key,
    this.store,
  });

  final Store? store;

  @override
  Widget build(BuildContext context) {
    log('${store?.storeImage}');
    return SliverAppBar(
        backgroundColor: ColorManager.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30),
          child: Text(
            store?.storeName ?? '',
            style: GoogleFonts.harmattan(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorManager.white),
          ),
        ),
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomImage(
                      url: store?.storeImage ?? '',
                    ),
                  ),
                ],
              ),
              store?.storeDescreption == ''
                  ? Container()
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: ColorManager.white.withAlpha(190),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        store?.storeDescreption ?? '',
                        style: getBoldStyle(
                            color: ColorManager.error, fontSize: 18),
                      ),
                    )
            ],
          ),
        ));
  }
}
