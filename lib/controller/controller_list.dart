import 'package:minha_geladeira/data/database/database.dart';
import 'package:minha_geladeira/data/models/model_food.dart';

class ControllerList {
  Future<List<Alimento>> listarAlimentos() async{
    return await DbHelper.listarAlimentos();
  }

}