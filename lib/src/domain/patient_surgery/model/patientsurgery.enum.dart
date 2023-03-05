import 'package:json_annotation/json_annotation.dart';

abstract class OFTJsonEnum {
  String getId();
  String getValue();
}

enum SelectAnswer implements OFTJsonEnum{
  @JsonValue('Si')
  YES("Si"),
  @JsonValue('No')
  NOT("No");

  final String value;

  const SelectAnswer(this.value);

  @override
  String getId() => this.name;

  @override
  String getValue() => this.value;
}

enum VisualAcuity implements OFTJsonEnum {
  @JsonValue('20/20')
  ONE("20/20"),
  @JsonValue('20/25')
  TWO("20/25"),
  @JsonValue('20/30')
  THREE("20/30"),
  @JsonValue('20/40')
  FOUR("20/40"),
  @JsonValue('20/60')
  FIVE("20/60"),
  @JsonValue('20/80')
  SIX("20/80"),
  @JsonValue('20/100')
  SEVEN("20/100"),
  @JsonValue('20/150')
  EIGHT("20/150"),
  @JsonValue('20/200')
  NINE("20/200"),
  @JsonValue('20/400')
  TEN("20/400");

  final String value;

  const VisualAcuity(this.value);

  @override
  String getId() => this.name;

  @override
  String getValue() => this.value;
}

enum PrevSurgeryDays implements OFTJsonEnum {
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
  @JsonValue('7')
  SEVEN('7'),
  @JsonValue('8')
  EIGHT('8'),
  @JsonValue('9')
  NINE('9'),
  @JsonValue('10')
  TEN('10'),
  @JsonValue('+10')
  OTHER('+10');

  final String value;

  const PrevSurgeryDays(this.value);

  @override
  String getId() => this.name;

  @override
  String getValue() => this.value;
}