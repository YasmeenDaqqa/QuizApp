import 'package:ecommerce_appe/models/users_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';
import 'package:ecommerce_appe/utils/api_paths.dart';
import  'package:ecommerce_appe/models/announcement_model.dart';

abstract class PofileServices {
  Future<List<usersModel>> getProducts();

}

class PofileervicesImpl extends PofileServices {
  final firestoreService = FirestoreService.instance;

  @override
  Future<List<usersModel>> getProducts() async =>
      await firestoreService.getCollection<usersModel>(
        path: ApiPaths.userrs(),
        builder: (data, documentId) =>
            usersModel.fromMap(data, documentId),
      );


}