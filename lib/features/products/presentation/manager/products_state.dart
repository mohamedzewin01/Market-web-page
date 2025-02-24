part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final ProductModelEntity productModelEntity;

  ProductsSuccess(this.productModelEntity);
}

final class ProductsFail extends ProductsState {
  final Exception exception;

  ProductsFail(this.exception);
}
