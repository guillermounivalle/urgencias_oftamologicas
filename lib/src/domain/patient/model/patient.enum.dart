import 'package:json_annotation/json_annotation.dart';

abstract class OFTJsonEnum {
  String getId();
  String getValue();
}

enum Gender implements OFTJsonEnum {
  @JsonValue('Masculino')
  MALE("Masculino"),
  @JsonValue('Femenino')
  FEMALE("Femenino"),
  @JsonValue('Otro')
  OTHER("Otro");

  final String value;

  const Gender(this.value);

  @override
  String getId() => this.name;

  @override
  String getValue() => this.value;
}

enum Scholarship implements OFTJsonEnum {
  @JsonValue('Primaria')
  ELEMENTARY('Primaria'),
  @JsonValue('Secundaria')
  HIGH_SCHOOL('Secundaria'),
  @JsonValue('Pre-Grado')
  UNDERGRADE('Pre-Grado'),
  @JsonValue('Post-Grado')
  GRADUATE('Post-Grado');

  final String value;

  const Scholarship(this.value);

  @override
  String getId() => this.name;

  @override
  String getValue() => this.value;
}

enum Provenance implements OFTJsonEnum {
  @JsonValue('Urbana')
  URBAN("Urbana"),
  @JsonValue('Rural')
  RURAL("Rural");

  final String value;

  const Provenance(this.value);

  @override
  String getId() => this.name;

  @override
  String getValue() => this.value;
}

enum EconomicStratum implements OFTJsonEnum {
  @JsonValue('1')
  ONE('1'),
  @JsonValue('2')
  TWO('2'),
  @JsonValue('3')
  THREE('3'),
  @JsonValue('4')
  FOUR('4'),
  @JsonValue('5')
  FIVE('5'),
  @JsonValue('6')
  SIX('6'),
  @JsonValue('+6')
  OTHER('+6');

  final String value;

  const EconomicStratum(this.value);

  @override
  String getId() => this.name;

  @override
  String getValue() => this.value;
}