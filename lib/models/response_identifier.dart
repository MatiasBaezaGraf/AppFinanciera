import 'package:api_test/models/models.dart';

class ResponseIdentifier {
    ResponseIdentifier({
        required this.id,
        required this.distribution,
        required this.dataset,
    });

    String id;
    String distribution;
    String dataset;

    factory ResponseIdentifier.fromJson(String str) => ResponseIdentifier.fromMap(json.decode(str));

    factory ResponseIdentifier.fromMap(Map<String, dynamic> json) => ResponseIdentifier(
        id: json["id"],
        distribution: json["distribution"],
        dataset: json["dataset"],
    );
}