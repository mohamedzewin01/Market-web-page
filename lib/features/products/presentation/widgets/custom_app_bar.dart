import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onTap,
    this.isLogo,
    this.title,
    this.color,
  });

  final void Function()? onTap;
  final bool? isLogo;
  final String? title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s25, bottom: AppSize.s16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: AppSize.s24,
                  color: color,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              title ?? '',
              style: getSemiBoldStyle(
                  color: color ?? ColorManager.orange, fontSize: AppSize.s25),
            ),
          ),
        ],
      ),
    );
  }
}
