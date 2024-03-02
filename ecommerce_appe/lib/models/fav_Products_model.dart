import 'package:ecommerce_appe/models/product_item_model.dart';


class favModel {
  final String id;
  final ProductItemModel product;


  favModel({
    required this.id,
    required this.product,
   
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'product': product.toMap()});

  
    return result;
  }

  factory favModel.fromMap(Map<String, dynamic> map) {
    return favModel(
      id: map['id'] ?? '',
      product: ProductItemModel.fromMap(map['product'],map['product']['id']),

    );
  }

  favModel copyWith({
    String? id,
    ProductItemModel? product,
   
  }) {
    return favModel(
      id: id ?? this.id,
      product: product ?? this.product,
 
    );
  }
}

List<favModel> dummyCartOrders = [];