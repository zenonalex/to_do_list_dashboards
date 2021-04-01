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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<ListaTarefas>(
        builder: (context, listaTarefas, widget) {
          return Column(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  color: Colors.blueGrey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ChartPriority(),
                    ChartConcluded(),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: ListaItemTarefa(),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
        ],
      ),
    );
  }
}
