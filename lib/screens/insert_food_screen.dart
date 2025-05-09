import 'package:flutter/material.dart';
import 'package:minha_geladeira/controller/controller_form.dart';
import 'package:minha_geladeira/core/constants/app_colors.dart';
import 'package:minha_geladeira/core/utils/responsive.dart';
import 'package:minha_geladeira/core/validator/validator_form.dart';
import 'package:minha_geladeira/screens/components/custom_text_field.dart';
import 'package:minha_geladeira/screens/components/date_custom.dart';
import 'package:minha_geladeira/screens/list_food_screen.dart';

class FoodInsert extends StatefulWidget {
  const FoodInsert({super.key});

  @override
  State<FoodInsert> createState() => _FoodInsertState();
}

class _FoodInsertState extends State<FoodInsert> {
  final controller = ControllerForm();
  void postAlimento() async {
    if (controller.formKey.currentState!.validate()) {
      final alimento = await controller.postAlimento();

      if (alimento != null) {
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Alimento adicionado com sucesso!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.primaryLight,
          padding: EdgeInsets.all(20),
          height: Responsive.height(context),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: Responsive.height(context) * 0.1,
                    child: Text(
                      'Insira um Alimento',
                      style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                CustomTextField(
                  label: "Nome do Alimento",
                  controller: controller.nomeController,
                  isRequiredValidator: true,
                  validator: requiredField('Digite um valor valido!'),
                ),
                DateCustom(
                    controller: controller.validadeController,
                    label: 'Selecione a data de validade'),
                CustomTextField(
                  label: "Quantidade",
                  controller: controller.qtdController,
                  isRequiredValidator: true,
                  validator: integerField('Insira um numero valido!'),
                ),
                CustomTextField(
                  label: "Categoria",
                  controller: controller.categoriaController,
                  isRequiredValidator: true,
                  validator: requiredField('Digite um valor valido!'),
                ),
                SizedBox(
                  width: Responsive.width(context),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        postAlimento();
                      },
                      child: Text('Adicionar Alimento',
                          style: TextStyle(color: Colors.white))),
                ),
                SizedBox(
                  height: 10,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
