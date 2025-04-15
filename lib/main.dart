import 'package:flutter/material.dart';
import 'package:minha_geladeira/screens/initial_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Geladeira',
      theme: ThemeData(
            useMaterial3: true,
      ),
      home: InitialScreen(),
locale: const Locale('pt', 'BR'), // 👈 adiciona localização
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}

