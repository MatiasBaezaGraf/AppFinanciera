import 'package:api_test/models/models.dart';

class ResponseParams {
    ResponseParams({
        required this.ids,
        required this.identifiers,
    });

    String ids;
    List<ResponseIdentifier> identifiers;

    factory ResponseParams.fromJson(String str) => ResponseParams.fromMap(json.decode(str));

    factory ResponseParams.fromMap(Map<String, dynamic> json) => ResponseParams(
        ids: json["ids"],
        identifiers: List<ResponseIdentifier>.from(json["identifiers"].map((x) => ResponseIdentifier.fromMap(x))),
    );
}