import '../../../../core/common/api_result.dart';
import '../products_entities/products_entities.dart';

abstract class ProductsRepo {
  Future<Result<ProductModelEntity>> getProducts();
}
