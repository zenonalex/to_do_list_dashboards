import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../provider/tarefa.dart';

class ListaTarefas extends ChangeNotifier {
  List<Tarefa> tarefas = [
    Tarefa(
      name: 'Limpar a roupa',
      data: '30/04/2021',
      description: 'Lavar a roupa com sabão omo',
      priority: 'high',
    ),
    Tarefa(
      name: 'Lavar o carro',
      data: '01/05/2021',
      description: 'Lavar e aspirar o carro com produtos  específicos',
      priority: 'low',
    ),
    Tarefa(
      name: 'Cachorro no PetShop',
      data: '28/04/2021',
      description: 'Banho e tosa no cachorro',
      priority: 'critical',
    ),
    Tarefa(
      name: 'Fazer o almoço',
      data: '28/04/2021',
      description: 'Preparar uma comida gostosa',
      priority: 'standard',
    ),
  ];

  toggleIsChecked(Tarefa tarefa) {
    tarefa.isChecked = !tarefa.isChecked;
    notifyListeners();
  }

  priority(Tarefa tarefa) {
    final List<Color> colors = <Color>[
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.purple
    ];

    if (tarefa.priority == 'low') {
      return colors[0];
    }

    if (tarefa.priority == 'standard') {
      return colors[1];
    }

    if (tarefa.priority == 'high') {
      return colors[2];
    }

    if (tarefa.priority == 'critical') {
      return colors[3];
    }
  }
}
