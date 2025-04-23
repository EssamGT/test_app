
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/features/main_page/data/models/products_for_cart.dart';
import 'package:test_app/features/main_page/data/models/products_response.dart';
import 'package:test_app/features/main_page/domain/usecase/usecase.dart';

part 'product_cubit_state.dart';

@singleton
class ProductCubit extends Cubit<ProductCubitState> {
  Usecase usecase;

  ProductCubit(this.usecase) : super(ProductCubitInitial());
  List<OrderItem> productsCart = [];
  List<ProductResponse> productsSug = [];
  static ProductCubit get(BuildContext context) => BlocProvider.of(context);
  getSuggestions() async {
    var response = await usecase.call();
    response.fold(
      (data) {
        productsSug = data.products;
        emit(Succses(data));
        emit(CartList(List.from(productsCart)));
      },
      (error) {
        emit(Error(error));
      },
    );
  }

  
  addToCart(int quantity, String item) {
    productsCart.add(OrderItem(quantity, item));
    emit(CartList(List.from(productsCart)));
  }
  clearCart() {
    productsCart.clear();
    emit(CartList(List.from(productsCart)));
  }
  addNote(int index, String note) {
    productsCart[index].note = note;
    emit(CartList(List.from(productsCart)));
  }

  addIamge(int index, XFile image) {
    productsCart[index].image = image;
    emit(CartList(List.from(productsCart)));
  }

  Future<void> pickImageFromGallery(int index) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      addIamge(index, pickedFile);
    }
  }

  String getTotalQuantity() {
    int totalquantity = 0;
    for (int i = 0; i < productsCart.length; i++) {
      totalquantity += productsCart[i].quantity;
    }
    return totalquantity.toString();
  }
}
