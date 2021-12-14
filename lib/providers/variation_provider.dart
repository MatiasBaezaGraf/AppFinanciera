import 'package:api_test/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VariationProvider extends ChangeNotifier {

  //ARGENTINA
  String _base = 'apis.datos.gob.ar';
  String _ids = '101.1_I2NG_2016_M_22:percent_change';

  List<List<dynamic>> indicator = [];

  VariationProvider() {
    print('Variation provider inicializado');

    this.getTickers();
  }

  getTickers() async {
    var url = Uri.https(this._base, '/series/api/series', {
      'ids' : _ids 
    });

    print(url);

    final response = await http.get(url);
    final ipcResponse = VariationResponse.fromJson( response.body );

    indicator = ipcResponse.data;

    notifyListeners();
  }

}