import 'package:flutter/material.dart';
import 'package:minha_geladeira/controller/controller_list.dart';
import 'package:minha_geladeira/core/constants/app_colors.dart';
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
    backgroundColor: AppColors.primaryLight,
    body: FutureBuilder<List<Alimento>>(
      future: controller.listarAlimentos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}', style: TextStyle(color: Colors.red)));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum alimento cadastrado!'));
        }

        final alimentos = snapshot.data!;
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: alimentos.length,
          itemBuilder: (context, index) {
            final alimento = alimentos[index];
            return CardFood(
              nome: alimento.nome,
              qtd: alimento.quantidade.toString(),
              data: alimento.validade,
              categoria: alimento.categoria,
            );
          },
        );
      },
    ),
  );
}
}