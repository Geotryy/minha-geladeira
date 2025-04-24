import 'package:flutter/material.dart';
import 'package:minha_geladeira/core/constants/app_colors.dart';
import 'package:minha_geladeira/screens/insert_food_screen.dart';
import 'package:minha_geladeira/screens/list_food_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [FoodInsert(), ListFoodScreen()],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
           decoration: const BoxDecoration(
            color: AppColors.textPrimary,
           ),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
                pageController.jumpToPage(index);
              });
            },
            selectedIndex: currentIndex,
              gap: 8,
              backgroundColor: AppColors.textPrimary,
                color: Colors.white,
                activeColor: AppColors.background,
                tabBackgroundColor: AppColors.primary,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Adicionar',
                ),
              ]),
        ));
  }
}
