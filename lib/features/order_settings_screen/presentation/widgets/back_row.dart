import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/values_manager.dart';

Widget backRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24,),
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.lightGreen,
            size: AppSize.s24,
          ),
        ),
      ],
    ),
  );
}
