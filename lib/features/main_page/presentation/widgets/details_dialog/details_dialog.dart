import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/strings_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
import 'package:test_app/features/main_page/presentation/widgets/details_dialog/note_text_field.dart';

void showDetailsDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (_) {
      var cubit = ProductCubit.get(context);
      return AlertDialog(
        backgroundColor: ColorManager.white,
        title: Text(StringsManager.addDetails),
        actions: [
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
            ),
            color: ColorManager.lightGreen,

            onPressed: () {
              Navigator.of(context).pop();
              cubit.pickImageFromGallery(index);
            },
            child: Text(
              StringsManager.addImage,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
            ),
            color: ColorManager.lightGreen,

            onPressed: () {
              Navigator.of(context).pop();
              showNoteTextField(context, index);
            },
            child: Text(
              StringsManager.addNote,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      );
    },
  );
}
