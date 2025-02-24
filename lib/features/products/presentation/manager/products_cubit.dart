import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fadaalhalij/features/products/domain/use_cases/products_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/products_entities/products_entities.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final ProductsUseCase _productsUseCase;

  ProductsCubit(this._productsUseCase) : super(ProductsInitial());

  Future<void> getProductsData() async {
    emit(ProductsLoading());
    final result = await _productsUseCase.getProductsData();
    log('ProductsCubit: getProductsData: $result');
    switch (result) {
      case Success<ProductModelEntity>():
        {
          if (!isClosed) {
            emit(ProductsSuccess(result.data));
          }
          log('ProductsCubit: getProductsData: ${result.data}');
        }

      case Fail<ProductModelEntity>():
        {
          emit(ProductsFail(result.exception));
          log('ProductsCubit: getProductsData: ${result.exception}');
        }
    }
  }
}
