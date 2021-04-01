import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/lista_tarefas.dart';
import '../widget/item_tarefa.dart';

class ListaItemTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListaTarefas listaTarefas = Provider.of<ListaTarefas>(context);

    return ListView.builder(
      itemCount: listaTarefas.tarefas.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            listaTarefas.tarefas.removeAt(index);
            print(listaTarefas.tarefas.length);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'Item removido. você possui ${listaTarefas.tarefas.length} itens na lista'),
            ));
          },
          child: ItemTarefa(listaTarefas.tarefas[index]),
        );
      },
    );
  }
}
