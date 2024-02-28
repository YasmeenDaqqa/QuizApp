import 'package:ecommerce_appe/models/announcement_model.dart';
import 'package:ecommerce_appe/models/product_item_modell .dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/services/categories_services.dart';

import 'package:ecommerce_appe/models/product_item_modell .dart';
part 'categories_state.dart';


class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

 final categoriesServices = CatrgoriesServicesImpl();

  void getCategoriesData() async {
    emit(CategoriesLoading());
    try {
      // Extract unique categories from dummyProducts
      
      final categories = await categoriesServices.getProducts();
     // await Future.delayed(const Duration(seconds: 2));
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}