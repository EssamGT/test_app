import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/font_manager.dart';
import 'package:test_app/core/res/strings_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
// Search Text Form 
Widget searchTextForm(BuildContext context, TextEditingController controller) {
  var cubit = ProductCubit.get(context);

  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGreen),
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
          hintText: StringsManager.enterProductName,
          hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: ColorManager.black,
            fontSize: FontSize.s14,
            fontWeight: FontWeightManager.medium,
          ),
        ),
      ),
      // validate to make sure that text is not null or not unknown
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return StringsManager.pEnterProductName;
        }
        if (!cubit.productsSug
            .map((e) => e.name.toLowerCase())
            .contains(value.toLowerCase())) {
          return StringsManager.pValidProduct;
        }
        return null;
      },
      suggestionsCallback: (pattern) {
        return cubit.productsSug.where(
          (item) => item.name.toLowerCase().contains(pattern.toLowerCase()),
        );
      },
      onSuggestionSelected: (suggestion) {
        controller.text = suggestion.name;
      },

      itemBuilder: (context, suggestion) {
        return Container(
          color: ColorManager.white,
          child: ListTile(title: Text(suggestion.name)),
        );
      },
    ),
  );
}
// qunatity Text Form 

Widget quantityTextField(
  BuildContext context,
  TextEditingController controller,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightGreen),
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        hintText: StringsManager.enterProductQuantity,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.black,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.medium,
        ),
      ),
      keyboardType: TextInputType.number,
      // validate to make sure that it is only number and bigger than 0 
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return StringsManager.pEnterValidProductQuantity;
        }

        final parsed = int.tryParse(value);
        if (parsed == null) {
          return StringsManager.pEnterValidProductQuantity;
        }

        if (parsed <= 0) {
          return StringsManager.quantityValidate;
        }

        return null;
      },
    ),
  );
}
