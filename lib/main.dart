import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minha_geladeira/screens/welcome_screen.dart';


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
      home: WelcomeScreen(),
locale: const Locale('pt', 'BR'), // 👈 adiciona localização
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}

class TemporaryMessage extends StatefulWidget {
  const TemporaryMessage({super.key});

  @override
  State<TemporaryMessage> createState() => _TemporaryMessageState();
}

class _TemporaryMessageState extends State<TemporaryMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Refazendo o projeto"),);
  }
}
