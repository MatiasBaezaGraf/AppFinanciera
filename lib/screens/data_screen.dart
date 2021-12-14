import 'package:api_test/providers/enterprise_provider.dart';
import 'package:api_test/screens/ipc_screen.dart';
import 'package:api_test/widgets/ipc_chart.dart';
import 'package:api_test/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class DataScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final enterpriseProvider = Provider.of<EnterpriseProvider>(context);
    final resp = enterpriseProvider.indicator;
    final List<DataRow> data = _createDataRowList( resp );


    if( resp.length == 0 ) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Obteniendo datos...'),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Vista de lista'),
      ),
      drawer: SideMenu(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [

              DataColumn(
                label: Container(
                  alignment: Alignment.center,
                  width: 70,
                  child: Text(
                    'Período', 
                    style: TextStyle(
                      color: Colors.yellow
                    ),
                  )
                )
              ),

              DataColumn(
                label: Container(
                  alignment: Alignment.center,
                  width: 70,
                  child: Text(
                    'IPC', 
                    style: TextStyle(
                      color: Colors.yellow
                    ),
                  )
                )
              ),

              DataColumn(
                label: Container(
                  alignment: Alignment.center,
                  width: 70,
                  child: Text(
                    'Variación', 
                    style: TextStyle(
                      color: Colors.yellow
                    ),
                  )
                )
              )
          
            ],
            rows: data,
          ),
        ),
      ),
    );
  }

  List<DataRow> _createDataRowList(List<List> resp) {

    double variation = 0;
    int loop = 0;

    double beforeIpc = 0;
    
    
    if(resp[0].length <= 2){
      for(var i in resp){
        if( loop == 0){
          i.add('Intervalo');
        } else {
          variation = ((i[1] - beforeIpc)/beforeIpc)*100;
          i.add(variation.toStringAsFixed(2)+'%');
        }
        loop = loop + 1;
        beforeIpc = i[1];
      }
    }

    List<DataRow> dataList = resp.map((e) => DataRow(
      cells: [
        DataCell(Container(alignment: Alignment.center,child: Text(e[0], style: TextStyle( fontWeight: FontWeight.bold )))), 
        DataCell(Container(alignment: Alignment.center,child: Text(e[1].toString()))),
        DataCell(Container(alignment: Alignment.center,child: Text(e[2].toString()))),  
      ]
    )).toList();
    return dataList;

  }

}