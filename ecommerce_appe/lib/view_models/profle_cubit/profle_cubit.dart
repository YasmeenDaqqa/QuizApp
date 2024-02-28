import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/models/users_model.dart';
import 'package:ecommerce_appe/services/pofile_services.dart';
part 'profle_state.dart';

class ProfleCubit extends Cubit<ProfleState> {
  ProfleCubit() : super(ProfleInitial());

  final userServices = PofileervicesImpl();

  void getProfleData() async {
    emit(ProfleLoading());
    try {
      // Extract unique categories from dummyProducts
      final user = await userServices.getProducts();
      //await Future.delayed(const Duration(seconds: 2));
     emit(ProfleLoaded(user));
    } catch (e) {
      emit(ProfleError(e.toString()));
    }
  }
}