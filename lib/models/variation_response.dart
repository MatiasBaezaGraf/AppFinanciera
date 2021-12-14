import 'package:api_test/models/models.dart';

// To parse this JSON data, do
//
//     final variationResponse = variationResponseFromMap(jsonString);

import 'dart:convert';

class VariationResponse {
    VariationResponse({
        required this.data,
        required this.count,
    });

    List<List<dynamic>> data;
    int count;

    factory VariationResponse.fromJson(String str) => VariationResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VariationResponse.fromMap(Map<String, dynamic> json) => VariationResponse(
        data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "count": count,
    };
}
