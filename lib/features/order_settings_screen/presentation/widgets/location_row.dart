import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/font_manager.dart';
import 'package:test_app/core/res/strings_manager.dart';
import 'package:test_app/core/res/values_manager.dart';

Widget locationRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: AppPadding.p20,
      vertical: AppPadding.p18,
    ),

    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        SizedBox(
            width: AppSize.s120,
          child: Text(StringsManager.location,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: FontSize.s14,

              color: ColorManager.burble,
            ),
          )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.left,
              "Deliver to:",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: FontSize.s10,
                color: ColorManager.gray,
                fontWeight: FontWeightManager.regular,
              ),
            ),

            Text(
              StringsManager.locationd,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: FontSize.s16,
                color: ColorManager.black,
                fontWeight: FontWeightManager.regular
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
