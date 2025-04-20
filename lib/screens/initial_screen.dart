import 'package:flutter/material.dart';
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
        decoration: BoxDecoration( image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.cover)),
        height: Responsive.height(context),
        width: Responsive.width(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                'Minha Geladeira',
                style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Responsive.height(context) * 0.02,),
              Text(
                'Pra nunca mais esquecer aquele iogurte',
                style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Responsive.height(context) * 0.07,),
              SizedBox(
                width: Responsive.width(context) * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => FoodInsert()));
                    },
                    child: Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 15),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
