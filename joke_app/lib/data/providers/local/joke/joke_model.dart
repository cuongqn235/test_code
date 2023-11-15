import 'package:joke_app/data/providers/local/dao/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'joke_model.g.dart';

@JsonSerializable()
class JokeModel extends AppBaseModel {
  JokeModel({
    required this.id,
    required this.isFunny,
    required this.descriptionJoke,
    required this.createdAt,
  });
  final String id;
  final bool? isFunny;
  final String descriptionJoke;
  final String createdAt;

  static const table = 'joke';

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$JokeModelToJson(this);
}
