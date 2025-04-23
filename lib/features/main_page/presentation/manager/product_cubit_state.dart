part of 'product_cubit_cubit.dart';

@immutable
sealed class ProductCubitState {}

final class ProductCubitInitial extends ProductCubitState {}

// ignore: must_be_immutable
class Succses extends ProductCubitState {
  ProductsResponse response;
  Succses(this.response);
}

// ignore: must_be_immutable
class Error extends ProductCubitState {
  String errorMessage;
  Error(this.errorMessage);
}

// ignore: must_be_immutable
class CartList extends ProductCubitState {
  List<OrderItem> list;
  CartList(this.list);
}
