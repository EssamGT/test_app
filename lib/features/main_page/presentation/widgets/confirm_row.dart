import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
import 'package:test_app/features/order_settings_screen/presentation/settings_screen.dart';

class ConfirmRow extends StatelessWidget {
  const ConfirmRow({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProductCubit.get(context);
    bool show = cubit.productsCart.isEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child:
          show
              ? Container()
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p20,
                    ),
                    child: IconButton(
                      onPressed: () {
                        cubit.clearCart();
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorManager.lightGreen,
                        size: AppSize.s24,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => BlocProvider.value(
                                value:
                                    context
                                        .read<
                                          ProductCubit
                                        >(), // <-- reuses the existing Cubit
                                child: SettingsScreen(),
                              ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: ColorManager.lightGreen,
                      size: AppSize.s24,
                    ),
                  ),
                ],
              ),
    );
  }
}
