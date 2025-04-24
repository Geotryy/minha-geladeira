import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minha_geladeira/core/constants/app_colors.dart';

class CardFood extends StatelessWidget {
  final String nome;
  final String categoria;
  final DateTime data;
  final String qtd;

  const CardFood({
    super.key,
    required this.categoria,
    required this.nome,
    required this.data,
    required this.qtd,
  });

  @override
  Widget build(BuildContext context) {
    final vencido = data.isBefore(DateTime.now());
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.kitchen, size: 32, color: vencido ? Colors.red : AppColors.textPrimary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Categoria: $categoria'),
                  Text('Quantidade: $qtd'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Validade: ${DateFormat('dd/MM/yyyy').format(data)}',
                          style: TextStyle(
                            color: vencido ? Colors.red : Colors.grey.shade700,
                            fontWeight: vencido ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                         IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,))],
                    ),
                  ),
             ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
