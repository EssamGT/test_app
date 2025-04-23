
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/remote/api_manager.dart';
import 'package:test_app/core/remote/ednpoints.dart';
import 'package:test_app/features/main_page/data/data_source/daw.dart';
import 'package:test_app/features/main_page/data/models/products_response.dart';

@Injectable(as: Daw)
class DawImpl extends Daw {
  ApiManager apiManager;
  @factoryMethod
  DawImpl(this.apiManager);
  @override
  Future<Either<ProductsResponse, String>> getProductsSugestion() async {
    try {
      var response = await apiManager.getRequest(Endpoints.sample);
      if (response.statusCode != 200) {
        return Right(response.statusMessage.toString());
      } else {
        
        return Left(ProductsResponse.fromJson(response.data));
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
