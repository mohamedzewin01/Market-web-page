class ProductModelEntity {
  ProductModelEntity({
    this.status,
    this.products,
  });

  String? status;
  List<ProductsEntity>? products;
}

class ProductsEntity {
  ProductsEntity({
    this.idProduct,
    this.productName,
    this.productprice,
    this.description,
    this.imageCover,
    this.productpriceAfterDiscount,
    this.category,
    this.createdAt,
  });

  num? idProduct;
  String? productName;
  num? productprice;
  String? description;
  String? imageCover;
  num? productpriceAfterDiscount;
  String? category;
  String? createdAt;
}
