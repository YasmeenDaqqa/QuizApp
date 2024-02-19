import 'package:ecommerce_app/models/product_item_modell.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/views/widgets/prduct_iteme.dart';
import 'package:ecommerce_app/view_models/categories_cubit/categories_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategoriesData(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is CategoriesLoaded) {
            final categories = state.categories;
        
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24.0),
                    GridView.builder(
                      itemCount: dummyProducts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: ProductItemC(
                            productItem: dummyProducts[index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
      }));
  }
}
