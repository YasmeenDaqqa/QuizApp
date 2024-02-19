import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
part 'profle_state.dart';

class ProfleCubit extends Cubit<ProfleState> {
  ProfleCubit() : super(ProfleInitial());

  void getProfleData() async {
    emit(ProfleLoading());
    try {
      // Extract unique categories from dummyProducts
      final favorite = favProducts.map((product) => product.category).toSet().toList();
      await Future.delayed(const Duration(seconds: 2));
     emit(ProfleLoaded(favorite));
    } catch (e) {
      emit(ProfleError(e.toString()));
    }
  }
}