import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4572F8),
      body: Stack(
        children: [
          // Imagem no topo à esquerda
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/welcome_screen.png",
            ),
          ),

          // Conteúdo central (logo + texto)
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Mantém o conteúdo no centro
                children: [
                  Lottie.asset(
  'assets/animations/logo.json',
  width: 300,
  height: 300,
  repeat: true,
),
                  SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "Mais controle, Menos desperdício!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6D8CFF),
                        foregroundColor: Colors.white,
                        elevation: 8, // controla a sombra
                        shadowColor: const Color(0xFF4572F8).withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // cantos arredondados
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text("Iniciar", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
