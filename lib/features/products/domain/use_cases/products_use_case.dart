import 'package:fadaalhalij/features/products/domain/products_entities/products_entities.dart';

import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../repositories/products_repo.dart';

@injectable
class ProductsUseCase {
  final ProductsRepo products;

  ProductsUseCase(this.products);

  Future<Result<ProductModelEntity>> getProductsData() {
    return products.getProducts();
  }
}
