import 'package:flutter/material.dart';
import 'package:test_app/core/res/Strings_manager.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';

Widget orderDetailsRow(BuildContext context) {
  bool empty = ProductCubit.get(context).productsCart.isEmpty;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          StringsManager.order,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(width: AppSize.s5),
        empty
            ? Text(
              '112 (allow edit)',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.lightGreen,
              ),
            )
            : Text(
              '112096',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.lightGreen,
              ),
            ),
      ],
    ),
  );
}
