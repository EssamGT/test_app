import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/font_manager.dart';
import 'package:test_app/core/res/strings_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
import 'package:test_app/features/order_settings_screen/presentation/widgets/location_row.dart';
import 'package:test_app/features/order_settings_screen/presentation/widgets/text_row.dart';

Widget dataBox(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        orderRow(
          context: context,
          label: StringsManager.order,
          subTitleColor: ColorManager.lightGreen,
          value: '112096',
        ),
        orderRow(
          context: context,
          label: StringsManager.orderName,
          subTitleColor: ColorManager.lightGreen,
          value: StringsManager.oderNamed,
          subtext: StringsManager.optional,
        ),
        orderRow(
          context: context,
          label: StringsManager.deliveryDate,
          subTitleColor: ColorManager.lightGreen,
          value: StringsManager.deliveryDated,
        ),
        orderRow(
          context: context,
          label: StringsManager.totalQuantity,
          subTitleColor: ColorManager.black,
          value: ProductCubit.get(context).getTotalQuantity(),
        ),
        orderRow(
          context: context,
          label: StringsManager.estimatedTotal,
          subTitleColor: ColorManager.black,
          value: StringsManager.estimatedTotald,
        ),
        locationRow(context),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            // vertical: AppPadding.p18,
          ),

          child: TextButton(
            onPressed: () {},
            child: Text(
              StringsManager.deliveryInstructions,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: FontSize.s14,
                color: ColorManager.lightGreen,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Center(
            
            child: MaterialButton(onPressed: (){},
            color: ColorManager.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),

            ),
            minWidth: double.infinity,
            height: AppSize.s51 ,
            child: Text(StringsManager.submit,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: ColorManager.white,
              fontWeight: FontWeightManager.light
            ),),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            // vertical: AppPadding.p18,
          ),

          child: TextButton(
            onPressed: () {},
            child: Text(
              StringsManager.saveAsDraft,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: FontSize.s14,
                color: ColorManager.lightGreen,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
