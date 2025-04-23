import 'package:flutter/material.dart';
import 'package:minha_geladeira/controller/controller_list.dart';

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
      body: FutureBuilder(
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
                return ListTile(
                  title: Text(alimento!.nome),
                  subtitle: Text('Validade: ${alimento.validade.toString()}'),
                );
              });
        },
      ),
    );
  }
}
