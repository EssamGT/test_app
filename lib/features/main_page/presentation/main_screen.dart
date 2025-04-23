import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/di/di.dart';
import 'package:test_app/core/res/assets_manager.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
import 'package:test_app/features/main_page/presentation/widgets/confirm_row.dart';
import 'package:test_app/features/main_page/presentation/widgets/list.dart';

import 'package:test_app/features/main_page/presentation/widgets/order_id_row.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<ProductCubit>()..getSuggestions(),

      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          shadowColor: ColorManager.transparent,
          title: Image.asset(AssetsManager.logoImage),

          leading: Image.asset(AssetsManager.menu),

          backgroundColor: ColorManager.white,
          automaticallyImplyLeading: false,
        ),

        backgroundColor: ColorManager.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: ColorManager.white,
              child: BlocBuilder<ProductCubit, ProductCubitState>(
                buildWhen: (previous, current) {
                  if (current is CartList || current is Error) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  if (state is CartList) {
                    return Column(
                      children: [
                        ConfirmRow(),
                        orderDetailsRow(context),
                        OrderListView(items: state.list),
                      ],
                    );
                  }
                  if (state is Error) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.lightGreen,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
