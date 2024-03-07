import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';
import 'package:ecommerce_appe/utils/api_paths.dart';

abstract class FavoriteServices {
 // Future<List<ProductItemModel>> getfav(String uid);
 // Future<void> updatefav(String uid, ProductItemModel cartOrder);
}

class FavoriteServicesImpl implements FavoriteServices {
  final firestoreService = FirestoreService.instance;

   Future<void> deleteFavoriteItem(String uid, ProductItemModel favorite) async =>
  await firestoreService.deleteData(
    path: ApiPaths.fav(uid, favorite.id),
  );

 // @override
 // Future<List<ProductItemModel>> getfav(String uid) async =>
  //    await firestoreService.getCollection<ProductItemModel>(
        //path: ApiPaths.favs(uid),
      //  builder: (data, documentId) => ProductItemModel.fromMap(data, documentId),
    //  );

 // @override
 // Future<void> updatefav(String uid, ProductItemModel cartOrder) async =>
   //   await firestoreService.setData(
      //  path: ApiPaths.fav(uid, cartOrder.id),
      //  data: cartOrder.toMap(),
    //  );
}