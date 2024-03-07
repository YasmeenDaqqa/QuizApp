import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:ecommerce_appe/utils/api_paths.dart';
import  'package:ecommerce_appe/models/announcement_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';
import  'package:ecommerce_appe/models/fav_Products_model.dart';
abstract class HomeServices {
  Future<List<ProductItemModel>> getProducts();
  Future<List<AnnouncementModel>> getAnnouncement();
  // Future<ProductItemModel> getProduct(String id);

  
  //Future<void> addToCart(String uid, favModel cartOrder);
}

class HomeServicesImpl extends HomeServices {
  final firestoreService = FirestoreService.instance;

  @override
  Future<List<ProductItemModel>> getProducts() async =>
      await firestoreService.getCollection<ProductItemModel>(
        path: ApiPaths.products(),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId),
      );

 @override
  Future<List<AnnouncementModel>> getAnnouncement() async =>
      await firestoreService.getCollection<AnnouncementModel>(
        path: ApiPaths.announcements(),
        builder: (data, documentId) =>
            AnnouncementModel.fromMap(data, documentId),
      );

  //      @override
 // Future<ProductItemModel> getProduct(String id) async =>
   //   await firestoreService.getDocument<ProductItemModel>(
   //     path: ApiPaths.product(id),
     //   builder: (data, documentId) =>
     //       ProductItemModel.fromMap(data, documentId),
     // );


 // @override
 // Future<void> addToCart(String uid, favModel cartOrder) async =>
  //    await firestoreService.setData(
   //     path: ApiPaths.fav(uid, cartOrder.id),
   //     data: cartOrder.toMap(),
    //  );
}