// import '../../domain/products_entities/products_entities.dart';
//
// class ProductModel {
//   ProductModel({
//     this.status,
//     this.products,});
//
//   ProductModel.fromJson(dynamic json) {
//     status = json['status'];
//     if (json['products'] != null) {
//       products = [];
//       json['products'].forEach((v) {
//         products?.add(Products.fromJson(v));
//       });
//     }
//   }
//   String? status;
//   List<Products>? products;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     if (products != null) {
//       map['products'] = products?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//   ProductModelEntity toProductModelEntity() => ProductModelEntity(
//     status: status,
//     products:
//     products?.map((product) => product.toProductsEntity()).toList(),
//   );
// }
//
// class Products {
//   Products({
//     this.idProduct,
//     this.productName,
//     this.productprice,
//     this.description,
//     this.imageCover,
//     this.productpriceAfterDiscount,
//     this.category,
//     this.descount,
//     this.status,
//     this.dateDescount,
//     this.createdAt,});
//
//   Products.fromJson(dynamic json) {
//     idProduct = json['id_product'];
//     productName = json['product_name'];
//     productprice = json['product_price'];
//     description = json['description'];
//     imageCover = json['image_cover'];
//     productpriceAfterDiscount = json['product_price_after_discount'];
//     category = json['category'];
//     descount = json['descount'];
//     status = json['status'];
//     dateDescount = json['date_descount'];
//     createdAt = json['createdAt'];
//   }
//   num? idProduct;
//   String? productName;
//   num? productprice;
//   String? description;
//   String? imageCover;
//   num? productpriceAfterDiscount;
//   String? category;
//   num? descount;
//   num? status;
//   String? dateDescount;
//   String? createdAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id_product'] = idProduct;
//     map['product_name'] = productName;
//     map['product_price'] = productprice;
//     map['description'] = description;
//     map['image_cover'] = imageCover;
//     map['product_price_after_discount'] = productpriceAfterDiscount;
//     map['category'] = category;
//     map['descount'] = descount;
//     map['status'] = status;
//     map['date_descount'] = dateDescount;
//     map['createdAt'] = createdAt;
//     return map;
//   }
//   ProductsEntity toProductsEntity() {
//     return ProductsEntity(
//         idProduct: idProduct,
//         productName: productName,
//         productprice: productprice,
//         description: description,
//         imageCover: imageCover,
//         productpriceAfterDiscount: productpriceAfterDiscount,
//         category: category,
//         createdAt: createdAt,
//         status: status,
//         dateDescount: dateDescount,
//         descount: descount
//     );
//   }
// }
