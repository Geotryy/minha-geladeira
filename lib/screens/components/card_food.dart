import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardFood extends StatefulWidget {
  final String nome;
  final String categoria;
  final DateTime data;
  final String qtd;
  const CardFood({super.key, required this.categoria, required this.nome, required this.data, required this.qtd});

  @override
  State<CardFood> createState() => _CardFoodState();
}

class _CardFoodState extends State<CardFood> {
  
  @override
  Widget build(BuildContext context) {
   return Card(
  elevation: 4,
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.fastfood, color: Colors.green.shade700),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.nome,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Categoria: ${widget.categoria}',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          'Quantidade: ${widget.qtd}',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          'Validade: ${DateFormat('dd/MM/yyyy').format(widget.data)}',
          style: TextStyle(
            fontSize: 16,
            color: widget.data.isBefore(DateTime.now())
                ? Colors.red
                : Colors.black,
          ),
        ),
      ],
    ),
  ),
);
  }}