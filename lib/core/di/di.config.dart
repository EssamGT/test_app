// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/main_page/data/data_source/daw.dart' as _i658;
import '../../features/main_page/data/data_source/daw_imp/daw_impl.dart'
    as _i1034;
import '../../features/main_page/data/repository/products_repo_impl.dart'
    as _i780;
import '../../features/main_page/domain/repository/products_repo.dart' as _i675;
import '../../features/main_page/domain/usecase/usecase.dart' as _i925;
import '../../features/main_page/presentation/manager/product_cubit_cubit.dart'
    as _i295;
import '../remote/api_manager.dart' as _i822;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i822.ApiManager>(() => _i822.ApiManager());
    gh.factory<_i658.Daw>(() => _i1034.DawImpl(gh<_i822.ApiManager>()));
    gh.factory<_i675.ProductsRepo>(
      () => _i780.ProductsRepoImpl(gh<_i658.Daw>()),
    );
    gh.factory<_i925.Usecase>(() => _i925.Usecase(gh<_i675.ProductsRepo>()));
    gh.singleton<_i295.ProductCubit>(
      () => _i295.ProductCubit(gh<_i925.Usecase>()),
    );
    return this;
  }
}
