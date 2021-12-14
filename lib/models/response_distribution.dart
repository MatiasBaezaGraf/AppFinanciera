import 'package:api_test/models/models.dart';

class ResponseDistribution {
    ResponseDistribution({
        required this.title,
        required this.downloadUrl,
    });

    String title;
    String downloadUrl;

    factory ResponseDistribution.fromJson(String str) => ResponseDistribution.fromMap(json.decode(str));

    factory ResponseDistribution.fromMap(Map<String, dynamic> json) => ResponseDistribution(
        title: json["title"],
        downloadUrl: json["downloadURL"],
    );
}