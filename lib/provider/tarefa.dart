import 'package:flutter/foundation.dart';

class Tarefa extends ChangeNotifier {
  String name;
  String description;
  String data; //alterar para formato de data
  String priority;
  bool isChecked;

  Tarefa({
    @required this.name,
    @required this.description,
    @required this.data,
    @required this.priority,
    this.isChecked = false,
  });
}
