import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/lista_tarefas.dart';
import '../widget/lista_item_tarefa.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Consumer<ListaTarefas>(
        builder: (context, listaTarefas, widget) {
          return ListaItemTarefa();
        },
      ),
    );
  }
}
