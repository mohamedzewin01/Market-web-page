import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/products_entities/products_entities.dart';

abstract class ProductsDataSource {
  Future<Result<ProductModelEntity>> getProducts();
}

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource {
  ApiService apiService;

  ProductsDataSourceImpl(this.apiService);

  @override
  Future<Result<ProductModelEntity>> getProducts() {
    return executeApi(() async {
      var response = await apiService.getAllCategories();
      var data = response.toProductModelEntity();
      return data;
    });
  }
}
