import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minha_geladeira/data/database/database.dart';
import 'package:minha_geladeira/data/models/model_food.dart';

class ControllerForm {
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final validadeController = TextEditingController();
  final qtdController = TextEditingController();
  final categoriaController = TextEditingController();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  final List<Alimento> alimentos = [];

  Future<Alimento?> postAlimento() async {
    if (!formKey.currentState!.validate()) return null;
    final novoAlimento = Alimento(
        id: DateTime.now().millisecondsSinceEpoch,
        nome: nomeController.text,
        validade: formatter.parse(validadeController.text),
        quantidade: int.tryParse(qtdController.text) ?? 0,
        categoria: categoriaController.text);

    alimentos.add(novoAlimento);
    DbHelper.inserirAlimento;
    clearController();
    return novoAlimento;
  }

  void clearController() {
    nomeController.clear();
    qtdController.clear();
    validadeController.clear();
    categoriaController.clear();
  }
}
