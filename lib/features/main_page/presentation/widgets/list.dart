import 'package:flutter/material.dart';
import 'package:test_app/core/res/color_manager.dart';
import 'package:test_app/core/res/values_manager.dart';
import 'package:test_app/features/main_page/data/models/products_for_cart.dart';
import 'package:test_app/features/main_page/presentation/manager/product_cubit_cubit.dart';
import 'package:test_app/features/main_page/presentation/widgets/add_dialog/add_product_menu.dart';
import 'package:test_app/features/main_page/presentation/widgets/background.dart';
import 'package:test_app/features/main_page/presentation/widgets/details_dialog/details_dialog.dart';

// ignore: must_be_immutable
class OrderListView extends StatelessWidget {
  List<OrderItem> items;
  OrderListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final rowHeight = AppSize.s48;
    var cubit = ProductCubit.get(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxHeight = MediaQuery.of(context).size.height;
        final lineCount = (maxHeight / rowHeight).ceil();
        final totalRows = items.isNotEmpty ? items.length + 15 : lineCount;

        return LinedPaperBackground(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: totalRows,
            padding: EdgeInsets.zero,

            itemBuilder: (context, index) {
              final bool isDataRow = index < items.length;

              return Material(
                color: ColorManager.transparent,
                child: InkWell(
                  onTap: () async {
                    if (isDataRow) {
                    } else {
                      
                      if (cubit.productsSug.isNotEmpty) {
                        addProductDialog(context);
                      } else {
                        await cubit.getSuggestions();

                        // ignore: use_build_context_synchronously
                        addProductDialog(context);
                      }
                    }
                  },
                  onLongPress: () {
                    if (isDataRow) {
                      final tappedItem = items[index];

                      if (tappedItem.note == null && tappedItem.image == null) {
                        showDetailsDialog(context, index);
                      }
                    } else {}
                  },
                  child: SizedBox(
                    height: AppSize.s48,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p10,
                      ),
                      child:
                          isDataRow
                              ? Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Quantity
                                  SizedBox(
                                    width: AppSize.s25,
                                    child: Text(
                                      items[index].quantity.toString(),
                                      textAlign: TextAlign.right,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleSmall,
                                    ),
                                  ),
                                  const SizedBox(width: AppSize.s10),
                                  // Item
                                  Text(
                                    items[index].item,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(width: AppSize.s10),

                                  items[index].note != null
                                      ? Icon(
                                        Icons.info_outline,
                                        color: ColorManager.lightGreen,
                                      )
                                      : SizedBox(),
                                  const SizedBox(width: AppSize.s10),

                                  items[index].image != null
                                      ? Icon(
                                        Icons.camera_alt_outlined,
                                        color: ColorManager.lightGreen,
                                      )
                                      : SizedBox(),
                                ],
                              )
                              : null, // Empty row with gesture
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
