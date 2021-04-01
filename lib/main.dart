import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/lista_tarefas.dart';
import './view/homewidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListaTarefas>.value(
          value: ListaTarefas(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeWidget()),
    );
  }
}
