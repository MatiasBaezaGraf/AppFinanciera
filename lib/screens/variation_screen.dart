import 'package:api_test/providers/variation_provider.dart';
import 'package:api_test/widgets/side_menu.dart';
import 'package:api_test/widgets/variation_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class VariationScreen extends StatefulWidget {

  @override
  State<VariationScreen> createState() => _VariationScreenState();
}

class _VariationScreenState extends State<VariationScreen> {

  String dropdownValue = '';

  initState() {
    dropdownValue = 'Sin filtro';
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final enterpriseProvider = Provider.of<VariationProvider>(context);
    final resp = enterpriseProvider.indicator;
    List<VariationData> data = _createVariationList(resp, dropdownValue);

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Variación'),
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
                        data = _createVariationList(resp, dropdownValue);
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
              child: VariationChart( formattedData: data )
            ),
          ),
        ],
      )
    );
  }

  _createVariationList(List<List<dynamic>> resp, [String? year]) {

    List<VariationData>finalList = [];
    
    if(resp.length != 0) {

      for(int i = 0; i < resp.length; i++) {
        
        try {
          resp[i][0] = DateFormat.yMMM().format(DateTime.parse(resp[i][0]));
        } catch(e) {}

      }

    }

    List<VariationData> variationList = resp.map((e) => VariationData(e[0], e[1]*100)).toList();

    if (year != null) {
      print('Claro que si');
      if (year != 'Sin filtro'){
        print('Pero claaaaro que si');
        for(int i = 0; i < variationList.length; i++){      
          if (variationList[i].date.contains(year)){
            finalList.add(variationList[i]);
          }
        }
      } else {
        finalList = variationList;
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