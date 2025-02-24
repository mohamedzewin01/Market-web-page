import 'package:fadaalhalij/features/products/domain/products_entities/products_entities.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/repositories/products_repo.dart';
import '../data_sources/products_data_source.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  ProductsDataSource productsDataSource;

  ProductsRepoImpl(this.productsDataSource);

  @override
  Future<Result<ProductModelEntity>> getProducts() {
    return productsDataSource.getProducts();
  }
}
