import 'package:ecommerce_appe/models/announcement_model.dart';
import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/services/home_services.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final homeServices = HomeServicesImpl();

  void getHomeData() async {
    emit(HomeLoading());
    try {
      final products = await homeServices.getProducts();
      final announcements = await homeServices.getAnnouncement();
      emit(HomeLoaded(products, announcements));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}