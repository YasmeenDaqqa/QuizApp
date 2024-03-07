import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_appe/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:ecommerce_appe/utils/route/app_routes.dart';
import 'package:ecommerce_appe/models/fav_Products_model.dart';
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

 @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavoriteData(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is FavoriteLoaded) {
            final categories = state.favorite;
        
    final orientation = MediaQuery.of(context).orientation;
    debugPrint('FavoritesPage build()');

   if (favProducts.isEmpty) {
     return const Center(
       child: Text('No Favorite Products!'),
     );
   }

  return ListView.builder(
        itemCount: favProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
             //  onTap: () {
       //  Navigator.of(context).pushNamed(
                //    AppRoutes.productDetails,
                //    arguments: favProducts[index],
               //   ).then((value) => setState(() {}));
               // },
                leading: Image.network(
                 favProducts[index].imgUrl,
                  height: 100,
                  width: 70,
                  fit: BoxFit.fill,
                ),
                title: Text(
                 favProducts[index].name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  '${favProducts[index].category} - \$${favProducts[index].price}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
               trailing: orientation == Orientation.portrait ? IconButton(
                onPressed: () {
                 //  setState(() {
                      favProducts.remove(favProducts[index]);
                  //  });
                },
                icon: const Icon(Icons.favorite),
                  color: Theme.of(context).primaryColor,
                ) : TextButton.icon(
                onPressed: () {
               //  setState(() {
                   favProducts.remove(favProducts[index]);
              //  });
                },
                 icon: const Icon(Icons.favorite),
                 label: const Text('Favorite'),
               ),
              ),
            ),
          );
        });

  }
    else {
            return const SizedBox();
          }
        }));
        }
}