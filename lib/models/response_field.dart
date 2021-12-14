import 'package:api_test/models/models.dart';

class ResponseField {
    ResponseField({
        required this.description,
        required this.id,
        required this.units,
        required this.representationMode,
        required this.representationModeUnits,
    });

    String description;
    String id;
    String units;
    String representationMode;
    String representationModeUnits;

    factory ResponseField.fromJson(String str) => ResponseField.fromMap(json.decode(str));

    factory ResponseField.fromMap(Map<String, dynamic> json) => ResponseField(
        description: json["description"],
        id: json["id"],
        units: json["units"],
        representationMode: json["representation_mode"],
        representationModeUnits: json["representation_mode_units"],
    );
}
