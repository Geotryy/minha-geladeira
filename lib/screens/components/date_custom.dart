import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minha_geladeira/screens/components/custom_text_field.dart';

class DateCustom extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String>? validator;

  const DateCustom({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  @override
  State<DateCustom> createState() => _DateCustomState();
}

class _DateCustomState extends State<DateCustom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          DateTime? dataEscolhida = await showDatePicker(
              context: context,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
              initialDate: DateTime.now(),
              helpText: 'Selecione a data de validade',
              cancelText: 'Cancelar',
              confirmText: 'Confirmar',
              locale: Locale('pt', 'BR'));
          if (dataEscolhida != null) {
            String dataFormatada =
                DateFormat('dd/MM/yyyy').format(dataEscolhida);
            setState(() {
              widget.controller.text = dataFormatada;
            });
          }
        },
        child: AbsorbPointer(
            child: CustomTextField(
                label: 'Selecione a validade', controller: widget.controller)));
  }
}
