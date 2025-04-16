import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: homeCubit.currentIndex,
              onTap: (index) {
                homeCubit.changeBottomNavBar(index);
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorite",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
            appBar: AppBar(),
            body: homeCubit.pages[0],
          );
        },
      ),
    );
  }
}
