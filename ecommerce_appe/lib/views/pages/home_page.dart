import 'package:ecommerce_appe/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce_appe/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/views/widgets/categories_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
   
      create: (context) {
      
        final   cubit = HomeCubit();
        cubit.getHomeData();
        return cubit;
      
        
      }
     ,
      
      child: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'Categories',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  HomeTabView(),
              CategoriesPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}