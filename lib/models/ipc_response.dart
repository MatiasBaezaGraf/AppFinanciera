// To parse this JSON data, do
//
//     final ipcResponse = ipcResponseFromMap(jsonString);

import 'dart:convert';

import 'package:api_test/models/models.dart';

class IpcResponse {

    IpcResponse({
        required this.data,
        required this.count,
        required this.meta,
        required this.params,
    });

    List<List<dynamic>> data;
    int count;
    List<ResponseDetails> meta;
    ResponseParams params;

    factory IpcResponse.fromJson(String str) => IpcResponse.fromMap(json.decode(str));

    factory IpcResponse.fromMap(Map<String, dynamic> json) => IpcResponse(
        data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        count: json["count"],
        meta: List<ResponseDetails>.from(json["meta"].map((x) => ResponseDetails.fromMap(x))),
        params: ResponseParams.fromMap(json["params"]),
    );
}












