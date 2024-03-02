import 'package:ecommerce_appe/models/address_model.dart';
import 'package:ecommerce_appe/models/cart_orders_model.dart';
import 'package:ecommerce_appe/models/payment_method_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';
import 'package:ecommerce_appe/utils/api_paths.dart';

abstract class CheckoutServices {
  Future<List<CartOrdersModel>> getCartItems(String uid);
  Future<List<AddressModel>> getAddresses(String uid,
      {bool fetchPreferred = false});
  Future<List<PaymentMethodModel>> getPaymentMethods(String uid,
      {bool fetchPreferred = false});
}

class CheckoutServicesImpl implements CheckoutServices {
  final firestoreService = FirestoreService.instance;

  @override
  Future<List<CartOrdersModel>> getCartItems(String uid) async =>
      await firestoreService.getCollection<CartOrdersModel>(
        path: ApiPaths.cartItems(uid),
        builder: (data, documentId) => CartOrdersModel.fromMap(data),
      );

  @override
  Future<List<AddressModel>> getAddresses(String uid,
          {bool fetchPreferred = false}) async =>
      await firestoreService.getCollection<AddressModel>(
        path: ApiPaths.addresses(uid),
        builder: (data, documentId) => AddressModel.fromMap(data),
        queryBuilder: fetchPreferred ? (query) => query.where('isFav', isEqualTo: true) : null,
      );

  @override
  Future<List<PaymentMethodModel>> getPaymentMethods(String uid,
          {bool fetchPreferred = false}) async =>
      await firestoreService.getCollection<PaymentMethodModel>(
        path: ApiPaths.paymentMethods(uid),
        builder: (data, documentId) => PaymentMethodModel.fromMap(data),
        queryBuilder: fetchPreferred ? (query) => query.where('isFav', isEqualTo: true) : null,
      );
}