import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minha_geladeira/core/utils/responsive.dart';
import 'package:minha_geladeira/data/models/model_food.dart';
import 'package:minha_geladeira/screens/components/custom_text_field.dart';
import 'package:minha_geladeira/screens/components/date_custom.dart';

class FoodInsert extends StatefulWidget {
  const FoodInsert({super.key});

  @override
  State<FoodInsert> createState() => _FoodInsertState();
}

class _FoodInsertState extends State<FoodInsert> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _validadeController = TextEditingController();
  final _qtdController = TextEditingController();
  final _categoriaController = TextEditingController();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  final List<Alimento> alimentos = [];

  void postAlimento() {
    if (_formKey.currentState!.validate()) {
      final novoAlimento = Alimento(
          id: DateTime.now().millisecondsSinceEpoch,
          nome: _nomeController.text,
          validade: formatter.parse(_validadeController.text),
          quantidade: int.tryParse(_qtdController.text) ?? 0,
          categoria: _categoriaController.text);
      setState(() {
        alimentos.add(novoAlimento);
        _nomeController.clear();
        _qtdController.clear();
        _validadeController.clear();
        _categoriaController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Alimento adicionado com sucesso!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Responsive.height(context),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: "Nome do Alimento",
                  controller: _nomeController,
                  isRequiredValidator: true,
                ),
                DateCustom(
                    controller: _validadeController,
                    label: 'Selecione a data de validade'),
                CustomTextField(
                    label: "Quantidade", controller: _qtdController),
                CustomTextField(
                    label: "Categoria", controller: _categoriaController),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        postAlimento();
                      }
                    },
                    child: Text('Adicionar Alimento'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
