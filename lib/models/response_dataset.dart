import 'package:api_test/models/models.dart';

class ResponseDataset {
    ResponseDataset({
        required this.title,
        required this.description,
        required this.issued,
        required this.source,
    });

    String title;
    String description;
    DateTime issued;
    String source;

    factory ResponseDataset.fromJson(String str) => ResponseDataset.fromMap(json.decode(str));

    factory ResponseDataset.fromMap(Map<String, dynamic> json) => ResponseDataset(
        title: json["title"],
        description: json["description"],
        issued: DateTime.parse(json["issued"]),
        source: json["source"],
    );
}