import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/features/main_page/data/models/products_response.dart';
import 'package:test_app/features/main_page/domain/repository/products_repo.dart';

@injectable
class Usecase {
  ProductsRepo repo;
  @factoryMethod
  Usecase(this.repo);
  Future<Either<ProductsResponse, String>> call() =>
      repo.getProductsSugestion();
}
