import 'package:flutter/material.dart';
import 'package:test_app/core/res/Strings_manager.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
import 'package:test_app/features/main_page/presentation/widgets/add_dialog/custom_text_form.dart';

void addProductDialog(BuildContext context) {
  // ignore: no_leading_underscores_for_local_identifiers
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  // ignore: no_leading_underscores_for_local_identifiers
  TextEditingController _itemController = TextEditingController();
  // ignore: no_leading_underscores_for_local_identifiers
  TextEditingController _quantityController = TextEditingController();
  var cubit = ProductCubit.get(context);
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: ColorManager.white,
        contentPadding: EdgeInsets.all(10),
        title: Text(
          StringsManager.addProduct,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: ColorManager.black),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchTextForm(context, _itemController),
                quantityTextField(context, _quantityController),
              ],
            ),
          ),
        ),
        actions: [
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
            ),
            color: ColorManager.lightGreen,

            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
            ),
            color: ColorManager.lightGreen,

            onPressed: () {
              if (_key.currentState!.validate()) {
                cubit.addToCart(
                  int.parse(_quantityController.text),
                  _itemController.text,
                );
                Navigator.of(context).pop();
              }
            },
            child: Text(
              'Add Product',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      );
    },
  );
}
