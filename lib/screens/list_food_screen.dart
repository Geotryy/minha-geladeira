import 'package:flutter/material.dart';
import 'package:minha_geladeira/controller/controller_list.dart';
import 'package:minha_geladeira/data/models/model_food.dart';
import 'package:minha_geladeira/screens/components/card_food.dart';

class ListFoodScreen extends StatefulWidget {
  const ListFoodScreen({super.key});

  @override
  State<ListFoodScreen> createState() => _ListFoodScreenState();
}

class _ListFoodScreenState extends State<ListFoodScreen> {
  final controller = ControllerList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Alimento>>(
        future: controller.listarAlimentos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('Nenhum alimento cadastrado!');
          }
          if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          }
          final alimentos = snapshot.data!;
          return ListView.builder(
              itemCount: alimentos.length,
              itemBuilder: (context, index) {
                final alimento = alimentos[index];
                return CardFood(
                 nome: alimento.nome,
                 qtd: alimento.quantidade.toString(),
                 data: alimento.validade,
                 categoria: alimento.categoria,
                );
              });
        },
      ),
    );
  }
}
