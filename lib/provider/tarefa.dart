import 'package:flutter/foundation.dart';

class Tarefa {
  String name;
  String description;
  String data; //alterar para formato de data
  bool isChecked;

  Tarefa({
    @required this.name,
    @required this.description,
    @required this.data,
    this.isChecked = false,
  });
}
