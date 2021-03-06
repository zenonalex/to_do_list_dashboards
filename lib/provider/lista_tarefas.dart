import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tarefa.dart';

class ListaTarefas extends ChangeNotifier {
  List<Tarefa> tarefas = [
    Tarefa(
      name: 'Limpar a roupa',
      data: '30/04/2021',
      description: 'Lavar a roupa com sabão omo',
      priority: 'high',
    ),
    Tarefa(
      name: 'Passar o pano',
      data: '30/04/2021',
      description: 'Passar o pano com desinfetante',
      priority: 'critical',
    ),
    Tarefa(
      name: 'Lavar o carro',
      data: '01/05/2021',
      description: 'Lavar e aspirar o carro com produtos  específicos',
      priority: 'low',
    ),
    Tarefa(
      name: 'Cachorro no PetShop',
      data: '28/04/2021',
      description: 'Banho e tosa no cachorro',
      priority: 'critical',
    ),
    Tarefa(
      name: 'Fazer o almoço',
      data: '28/04/2021',
      description: 'Preparar uma comida gostosa',
      priority: 'standard',
    ),
    Tarefa(
      name: 'Fazer compras',
      data: '28/04/2021',
      description: 'Ir ao supermercado',
      priority: 'low',
    ),
  ];

  toggleIsChecked(Tarefa tarefa) {
    tarefa.isChecked = !tarefa.isChecked;
    checkedSections();
    notifyListeners();
  }

  deleteTarefa(int index) {
    tarefas.removeAt(index);
    notifyListeners();
  }

  priority(Tarefa tarefa) {
    final List<Color> colors = <Color>[
      Colors.lightBlue,
      Colors.orange,
      Colors.red,
      Colors.purple
    ];

    if (tarefa.priority == 'low') {
      return colors[0];
    }

    if (tarefa.priority == 'standard') {
      return colors[1];
    }

    if (tarefa.priority == 'high') {
      return colors[2];
    }

    if (tarefa.priority == 'critical') {
      return colors[3];
    }
  }

  List<PieChartSectionData> checkedSections() {
    int _vChecked = 0;
    int _vNoChecked = 0;

    for (var i = 0; i < tarefas.length; i++) {
      if (tarefas[i].isChecked == true) {
        _vChecked++;
      }
    }

    for (var i = 0; i < tarefas.length; i++) {
      if (tarefas[i].isChecked == false) {
        _vNoChecked++;
      }
    }

    double _pChecked = (_vChecked / tarefas.length) * 100;
    double _pNoChecked = (_vNoChecked / tarefas.length) * 100;

    if (_vChecked == 0) {
      _pChecked = 0;
      _pNoChecked = 100;
    }

    return List.generate(2, (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: _pChecked,
            title: 'Concluído',
            radius: 50,
            titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.55,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: _pNoChecked,
            title: 'Pendente',
            radius: 50,
            titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.55,
          );
        default:
          return null;
      }
    });
  }

  List<PieChartSectionData> prioritySections() {
    int _vLow = 0;
    int _vStandard = 0;
    int _vHigh = 0;
    int _vCritical = 0;

    for (var i = 0; i < tarefas.length; i++) {
      if (tarefas[i].priority == 'low') {
        _vLow++;
      }
    }

    for (var i = 0; i < tarefas.length; i++) {
      if (tarefas[i].priority == 'standard') {
        _vStandard++;
      }
    }

    for (var i = 0; i < tarefas.length; i++) {
      if (tarefas[i].priority == 'high') {
        _vHigh++;
      }
    }

    for (var i = 0; i < tarefas.length; i++) {
      if (tarefas[i].priority == 'critical') {
        _vCritical++;
      }
    }

    double _pLow = (_vLow / tarefas.length) * 100;
    double _pStandard = (_vStandard / tarefas.length) * 100;
    double _pHigh = (_vHigh / tarefas.length) * 100;
    double _pCritical = (_vCritical / tarefas.length) * 100;

    return List.generate(4, (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
            color: Colors.orange,
            value: _pStandard,
            title: 'Standard',
            radius: 80,
            titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.55,
          );

        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: _pHigh,
            title: 'High',
            radius: 65,
            titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.55,
          );

        case 2:
          return PieChartSectionData(
            color: Colors.lightBlue,
            value: _pLow,
            title: 'Low',
            radius: 60,
            titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.55,
          );

        case 3:
          return PieChartSectionData(
            color: Colors.purple,
            value: _pCritical,
            title: 'Critical',
            radius: 75,
            titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            titlePositionPercentageOffset: 0.55,
          );
        default:
          return null;
      }
    });
  }
}
