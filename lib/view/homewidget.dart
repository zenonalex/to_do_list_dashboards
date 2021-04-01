import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/lista_tarefas.dart';
import '../widget/lista_item_tarefa.dart';
import '../widget/chart_priority.dart';
import '../widget/chart_concluded.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<ListaTarefas>(
        builder: (context, listaTarefas, widget) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ChartPriority(),
                  ChartConcluded(),
                ],
              ),
              Expanded(
                child: ListaItemTarefa(),
              ),
            ],
          );
        },
      ),
    );
  }
}
