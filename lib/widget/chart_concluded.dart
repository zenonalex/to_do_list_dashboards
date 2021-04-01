import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../provider/lista_tarefas.dart';

class ChartConcluded extends StatefulWidget {
  @override
  _ChartConcludedState createState() => _ChartConcludedState();
}

class _ChartConcludedState extends State<ChartConcluded> {
  @override
  Widget build(BuildContext context) {
    ListaTarefas _listaTarefas = Provider.of<ListaTarefas>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 170,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                  startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 5,
                  centerSpaceRadius: 30,
                  sections: _listaTarefas.checkedSections(),
                ),
              ),
            ),
            Text('Concluídos'),
          ],
        ),
      ),
    );
  }
}
