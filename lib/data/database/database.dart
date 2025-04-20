import 'package:flutter/material.dart';
import 'package:minha_geladeira/data/models/model_food.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> _getDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'geladeira.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE alimentos (
            id INTEGER PRIMARY KEY,
            nome TEXT,
            validade TEXT,
            quantidade INTEGER,
            categoria TEXT
          )
        ''');
      },
    );
  }

  static Future<void> inserirAlimento(Alimento alimento) async {
    final db = await _getDB();

    await db.insert(
      'alimentos',
      alimento.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  static Future<List<Alimento>> listarAlimentos() async {
    final db = await _getDB();

    final resultado = await db.query(
      'alimentos',
    );

    return resultado.map((mapa) => Alimento.fromMap(mapa)).toList();
  }
}
