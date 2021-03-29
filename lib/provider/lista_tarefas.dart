import 'package:flutter/cupertino.dart';
import 'package:todolist/provider/tarefa.dart';

class ListaTarefas extends ChangeNotifier {
  List<Tarefa> tarefas = [
    Tarefa(
      name: 'Limpar os pratos',
      data: '30/04/2021',
      description: 'Lavar a loça suja do almoço e da Janta',
    ),
    Tarefa(
      name: 'Lavar o carro',
      data: '01/05/2021',
      description: 'Lavar e aspirar o carro com produtos  específicos',
    ),
    Tarefa(
      name: 'Cachorro no PetShop',
      data: '28/04/2021',
      description: 'Banho e tosa no cachorro',
    ),
  ];

  checkIsChecked(Tarefa tarefa) {
    tarefa.isChecked = !tarefa.isChecked;
    notifyListeners();
  }
}
