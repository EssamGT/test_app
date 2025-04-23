import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/font_manager.dart';
import 'package:test_app/core/res/strings_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';

void showNoteTextField(BuildContext context, int index) {
  // ignore: no_leading_underscores_for_local_identifiers
  TextEditingController _controller = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var cubit = ProductCubit.get(context);
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: ColorManager.white,
        title: Text(StringsManager.addNote),
        content: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.lightGreen),
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                  hintText: StringsManager.enterNote,
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.copyWith(
                    color: ColorManager.black,
                    fontSize: FontSize.s14,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return StringsManager.emptyNote;
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s10),
              MaterialButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    cubit.addNote(index, _controller.text);
                    Navigator.of(context).pop();
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                ),
                color: ColorManager.lightGreen,

                child: Text(
                  StringsManager.add,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
