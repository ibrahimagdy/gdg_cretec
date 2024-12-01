import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/font_weight_helper.dart';
import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';

class OnBoardingContent extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingContent(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
            child: Image.asset(
              model.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          verticalSpace(30.h),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.semiBold,
              color: ColorsManager.jetBlack,
            ),
          ),
          verticalSpace(15.h),
          Text(
            model.body,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeightHelper.regular,
              color: ColorsManager.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
