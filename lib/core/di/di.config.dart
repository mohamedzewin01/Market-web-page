// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/products/data/data_sources/products_data_source.dart'
    as _i645;
import '../../features/products/data/repositories/products_repo_impl.dart'
    as _i83;
import '../../features/products/domain/repositories/products_repo.dart'
    as _i841;
import '../../features/products/domain/use_cases/products_use_case.dart'
    as _i258;
import '../../features/products/presentation/manager/products_cubit.dart'
    as _i321;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i645.ProductsDataSource>(
        () => _i645.ProductsDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i841.ProductsRepo>(
        () => _i83.ProductsRepoImpl(gh<_i645.ProductsDataSource>()));
    gh.factory<_i258.ProductsUseCase>(
        () => _i258.ProductsUseCase(gh<_i841.ProductsRepo>()));
    gh.factory<_i321.ProductsCubit>(
        () => _i321.ProductsCubit(gh<_i258.ProductsUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
