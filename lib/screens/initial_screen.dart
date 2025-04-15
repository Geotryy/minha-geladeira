import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minha_geladeira/core/constants/app_colors.dart';
import 'package:minha_geladeira/core/utils/responsive.dart';
import 'package:minha_geladeira/screens/insert_food_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        height: Responsive.height(context),
        width: Responsive.width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Minha Geladeira',
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Lottie.asset('assets/animations/fridge_animation.json',
                width: 200, height: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => FoodInsert()));
                },
                child: Text('Iniciar'))
          ],
        ),
      ),
    );
  }
}
