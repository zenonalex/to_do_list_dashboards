import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/lista_tarefas.dart';

import '../provider/tarefa.dart';

class ItemTarefa extends StatelessWidget {
  final Tarefa tarefa;

  ItemTarefa(this.tarefa);

  @override
  Widget build(BuildContext context) {
    final ListaTarefas listaTarefas = Provider.of<ListaTarefas>(context);

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: tarefa.isChecked ? Colors.green : Colors.grey,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.5, //extend the shadow
            offset: Offset(
              0.125, // Move to right 10  horizontally
              0.25, // Move to bottom 10 Vertically
            ),
          )
        ],
        color: Colors.white,
      ),
      margin: EdgeInsets.all(2.0),
      height: 60.0,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: listaTarefas.priority(tarefa),
            ),
            width: 10.0,
          ),
          Center(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              title: Text(
                tarefa.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(tarefa.description),
              trailing: tarefa.isChecked
                  ? Icon(
                      Icons.check_box,
                      color: Colors.green,
                      size: 25,
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      size: 25,
                    ),
              onTap: () {
                listaTarefas.toggleIsChecked(tarefa);
                print(tarefa.description);
                print(tarefa.isChecked);
              },
            ),
          ),
        ],
      ),
    );
  }
}
