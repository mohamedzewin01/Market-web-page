import '../../domain/products_entities/products_entities.dart';

class StoreModelResponse {
  StoreModelResponse({
    this.status,
    this.data,
  });

  StoreModelResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  ProductModelEntity toProductModelEntity() => ProductModelEntity(
        status: status,
        data: data,
      );
}

class Data {
  Data({
    this.status,
    this.store,
    this.products,
  });

  Data.fromJson(dynamic json) {
    status = json['status'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    products =
        json['products'] != null ? Products.fromJson(json['products']) : null;
  }

  String? status;
  Store? store;
  Products? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (store != null) {
      map['store'] = store?.toJson();
    }
    if (products != null) {
      map['products'] = products?.toJson();
    }
    return map;
  }
}

class Products {
  Products({
    this.status,
    this.bestDeals,
  });

  Products.fromJson(dynamic json) {
    status = json['status'];
    if (json['bestDeals'] != null) {
      bestDeals = [];
      json['bestDeals'].forEach((v) {
        bestDeals?.add(BestDeals.fromJson(v));
      });
    }
  }

  String? status;
  List<BestDeals>? bestDeals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (bestDeals != null) {
      map['bestDeals'] = bestDeals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BestDeals {
  BestDeals({
    this.idProduct,
    this.productName,
    this.productPrice,
    this.description,
    this.imageCover,
    this.productPriceAfterDiscount,
    this.category,
    this.descount,
    this.status,
    this.dateDescount,
    this.createdAt,
  });

  BestDeals.fromJson(dynamic json) {
    idProduct = json['id_product'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    description = json['description'];
    imageCover = json['image_cover'];
    productPriceAfterDiscount = json['product_price_after_discount'];
    category = json['category'];
    descount = json['descount'];
    status = json['status'];
    dateDescount = json['date_descount'];
    createdAt = json['createdAt'];
  }

  num? idProduct;
  String? productName;
  num? productPrice;
  String? description;
  String? imageCover;
  num? productPriceAfterDiscount;
  String? category;
  num? descount;
  num? status;
  String? dateDescount;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = idProduct;
    map['product_name'] = productName;
    map['product_price'] = productPrice;
    map['description'] = description;
    map['image_cover'] = imageCover;
    map['product_price_after_discount'] = productPriceAfterDiscount;
    map['category'] = category;
    map['descount'] = descount;
    map['status'] = status;
    map['date_descount'] = dateDescount;
    map['createdAt'] = createdAt;
    return map;
  }
}

class Store {
  Store(
      {this.storeId,
      this.storeName,
      this.storeDescreption,
      this.storeImage,
      this.storeDiscountTitle});

  Store.fromJson(dynamic json) {
    storeId = json['store_id'];
    storeName = json['store_name'];
    storeDescreption = json['store_descreption'];
    storeImage = json['store_image'];
    storeDiscountTitle = json['store_discount_title'];
  }

  num? storeId;
  String? storeName;
  String? storeDescreption;
  String? storeImage;
  String? storeDiscountTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['store_id'] = storeId;
    map['store_name'] = storeName;
    map['store_descreption'] = storeDescreption;
    map['store_image'] = storeImage;
    map['store_discount_title'] = storeDiscountTitle;
    return map;
  }
}
