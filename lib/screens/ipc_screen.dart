import 'package:api_test/providers/enterprise_provider.dart';
import 'package:api_test/widgets/ipc_chart.dart';
import 'package:api_test/widgets/side_menu.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {

 String dropdownValue = '';

  initState() {
    dropdownValue = 'Sin filtro';
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final enterpriseProvider = Provider.of<EnterpriseProvider>(context);
    final resp = enterpriseProvider.indicator;
    List<IpcData> data = _createIpcList(resp, dropdownValue);

    if( data.length == 0 ) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Obteniendo datos...'),
        ),
        body: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return 
    Scaffold(
      appBar: AppBar(
        title: Text('IPC'),
        actions:[
          Padding(
            padding: const EdgeInsets.all( 8.0 ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(4)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        data = _createIpcList(resp, dropdownValue);
                      });
                    },
                    items: _yearList(resp)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                  ),
                ),
              ),
            ),
          )
        ] 
      ),
      drawer: SideMenu(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: ResultChart( formattedData: data )
            ),
          ),
        ],
      )
    );
  }

  _createIpcList(List<List<dynamic>> resp, [String? year]) {

    List<IpcData>finalList = [];

    if(resp.length != 0) {

      for(int i = 0; i < resp.length; i++) {
        
        try {
          resp[i][0] = DateFormat.yMMM().format(DateTime.parse(resp[i][0]));
        } catch(e) {}

      }

    }

    List<IpcData> ipcList = resp.map((e) => IpcData(e[0], e[1])).toList();

    if (year != null) {
      if (year != 'Sin filtro'){
        for(int i = 0; i < ipcList.length; i++){      
          if (ipcList[i].date.contains(year)){
            finalList.add(ipcList[i]);
          }
        }
      } else {
        finalList = ipcList;
      }
    }

    return finalList;

  }

  _yearList(List<List<dynamic>> resp) {

    List<String> finalList = ['Sin filtro'];
    
    if(resp.length != 0) {

      for(int i = 0; i < resp.length; i++){
        String currentElement = resp[i][0].toString().substring(4, 8);
        if(!finalList.contains(currentElement)) finalList.add(currentElement);
      }

    }

    return finalList;

  }
}