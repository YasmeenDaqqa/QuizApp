import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:ecommerce_appe/utils/api_paths.dart';
import  'package:ecommerce_appe/models/announcement_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';

abstract class HomeServices {
  Future<List<ProductItemModel>> getProducts();
  Future<List<AnnouncementModel>> getAnnouncement();
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
}