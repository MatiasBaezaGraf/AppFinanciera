import 'package:api_test/models/models.dart';

class ResponseDetails {
    ResponseDetails({
        required this.frequency,
        required this.startDate,
        required this.endDate,
        required this.catalog,
        required this.dataset,
        required this.distribution,
        required this.field,
    });

    String? frequency;
    DateTime? startDate;
    DateTime? endDate;
    ResponseCatalog? catalog;
    ResponseDataset? dataset;
    ResponseDistribution? distribution;
    ResponseField? field;

    factory ResponseDetails.fromJson(String str) => ResponseDetails.fromMap(json.decode(str));

    factory ResponseDetails.fromMap(Map<String, dynamic> json) => ResponseDetails(
        frequency: json["frequency"] == null ? null : json["frequency"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        catalog: json["catalog"] == null ? null : ResponseCatalog.fromMap(json["catalog"]),
        dataset: json["dataset"] == null ? null : ResponseDataset.fromMap(json["dataset"]),
        distribution: json["distribution"] == null ? null : ResponseDistribution.fromMap(json["distribution"]),
        field: json["field"] == null ? null : ResponseField.fromMap(json["field"]),
    );

}