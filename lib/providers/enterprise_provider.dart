import 'package:api_test/models/ipc_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EnterpriseProvider extends ChangeNotifier {

  //ARGENTINA
  String _base = 'apis.datos.gob.ar';
  String _ids = '101.1_I2NG_2016_M_22';

  List<List<dynamic>> indicator = [];

  EnterpriseProvider() {
    print('Enterprise provider inicializado');

    this.getTickers();
  }

  getTickers() async {
    var url = Uri.https(this._base, '/series/api/series', {
      'ids' : _ids 
    });

    print(url);

    final response = await http.get(url);
    final ipcResponse = IpcResponse.fromJson( response.body );

    indicator = ipcResponse.data;

    notifyListeners();
  }

}