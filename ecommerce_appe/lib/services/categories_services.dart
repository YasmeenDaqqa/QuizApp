
import 'package:ecommerce_appe/utils/api_paths.dart';

import 'package:ecommerce_appe/services/firestore_service.dart';

import 'package:ecommerce_appe/models/product_item_modell .dart';
abstract class CategoriesServices {
  Future<List<ProductItemModell>> getProducts();
  
}

class CatrgoriesServicesImpl extends CategoriesServices {
  final firestoreService = FirestoreService.instance;

  @override
  Future<List<ProductItemModell>> getProducts() async =>
      await firestoreService.getCollection<ProductItemModell>(
        path: ApiPaths.catrgories(),
        builder: (data, documentId) =>
            ProductItemModell.fromMap(data, documentId),
      );
}