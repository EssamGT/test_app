import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/res/assets_manager.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
import 'package:test_app/features/order_settings_screen/presentation/widgets/back_row.dart';
import 'package:test_app/features/order_settings_screen/presentation/widgets/order_data_box.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key,required });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final cubit = context.read<ProductCubit>();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        shadowColor: ColorManager.transparent,
        title: Image.asset(AssetsManager.logoImage),
        backgroundColor: ColorManager.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: ColorManager.white,
      body: Builder(
        builder: (context) {
          return Column(children: [backRow(context), dataBox(context)]);
        },
      ),
    );
  }
}
