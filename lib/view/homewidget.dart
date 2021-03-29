import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/lista_tarefas.dart';
import 'package:todolist/provider/tarefa.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    ListaTarefas listaTarefas = Provider.of<ListaTarefas>(context);
    return ListView.builder(
      itemCount: listaTarefas.tarefas.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          //confirmDismiss: (),
          onDismissed: (_) {
            listaTarefas.tarefas.removeAt(index);
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Item Removido. Você possui ${listaTarefas.tarefas.length}')));
          },
          child: _buildItems(listaTarefas.tarefas[index]),
        );
      },
    );
  }

  _buildItems(Tarefa tarefa) {
    ListaTarefas listaTarefas = Provider.of<ListaTarefas>(context);
    return ListTile(
      title: Text(tarefa.name),
      subtitle: Text(tarefa.description),
      trailing: tarefa.isChecked
          ? Icon(Icons.check_box, color: Colors.green)
          : Icon(Icons.check_box_outline_blank),
      onTap: () {
        print('O numero de itens eh: ${listaTarefas.tarefas.length}');
        listaTarefas.checkIsChecked(tarefa);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Consumer<ListaTarefas>(
        builder: (context, listaTarefas, widget) {
          return _buildList();
        },
      ),
    );
  }
}
