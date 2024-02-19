import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  void getCategoriesData() async {
    emit(CategoriesLoading());
    try {
      // Extract unique categories from dummyProducts
      final categories = dummyProducts.map((product) => product.category).toSet().toList();
      await Future.delayed(const Duration(seconds: 2));
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}