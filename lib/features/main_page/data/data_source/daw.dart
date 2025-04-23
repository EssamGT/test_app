import 'package:dartz/dartz.dart';
import 'package:test_app/features/main_page/data/models/products_response.dart';

abstract class Daw {
  Future<Either<ProductsResponse, String>> getProductsSugestion();
}
