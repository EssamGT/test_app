import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/font_manager.dart';
import 'package:test_app/core/res/values_manager.dart';

Widget orderRow({
required  BuildContext context,
required Color subTitleColor,
  required String label, required String value, String? subtext}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.s120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: FontSize.s14,
                    
                    color: ColorManager.burble,
                  ),
                ),
                if (subtext != null)
                  Text(
                    subtext,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: FontSize.s10,
                      color: ColorManager.gray,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: FontSize.s16,
                color: subTitleColor,
                fontWeight: getFontWight(subTitleColor)
              ),
            ),
          ),
        ],
      ),
    );
  }
FontWeight getFontWight(Color color){
  if(color == ColorManager.lightGreen){
    return FontWeightManager.semiBold;
  }else{
    return FontWeightManager.regular;

  }
}