import 'package:api_test/models/models.dart';

class ResponseCatalog {
    ResponseCatalog({
        required this.title,
    });

    String title;

    factory ResponseCatalog.fromJson(String str) => ResponseCatalog.fromMap(json.decode(str));

    factory ResponseCatalog.fromMap(Map<String, dynamic> json) => ResponseCatalog(
        title: json["title"],
    );

}