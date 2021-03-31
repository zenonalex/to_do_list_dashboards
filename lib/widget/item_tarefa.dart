import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/lista_tarefas.dart';

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
        borderRadius: BorderRadius.circular(4.0),
      ),
      margin: EdgeInsets.all(5.0),
      height: 75.0,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  tarefa.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(tarefa.description),
                trailing: tarefa.isChecked
                    ? Icon(
                        Icons.check_box,
                        color: Colors.green,
                        size: 40,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        size: 40,
                      ),
                onTap: () {
                  listaTarefas.toggleIsChecked(tarefa);
                  print(tarefa.description);
                  print(tarefa.isChecked);
                },
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0)),
              color: listaTarefas.priority(tarefa),
            ),
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
