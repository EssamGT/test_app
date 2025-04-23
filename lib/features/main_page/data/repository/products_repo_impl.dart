import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/remote/internet_checker.dart';
import 'package:test_app/core/res/strings_manager.dart';
import 'package:test_app/features/main_page/data/data_source/daw.dart';
import 'package:test_app/features/main_page/data/models/products_response.dart';
import 'package:test_app/features/main_page/domain/repository/products_repo.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  Daw daw;
  @factoryMethod
  ProductsRepoImpl(this.daw);
  @override
  Future<Either<ProductsResponse, String>> getProductsSugestion() async {
    bool internet = await InternetChecker.internetConnection();
    if (internet) {
      var result = await daw.getProductsSugestion();
      return result.fold(
        (data) {
          return Left(data);
        },
        (erorr) {
          return Right(erorr);
        },
      );
    } else {
      return Right(StringsManager.noInternet);
    }
  }
}
