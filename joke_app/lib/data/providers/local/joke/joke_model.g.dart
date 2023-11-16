// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) => JokeModel(
      id: json['id'] as int?,
      isFunny: json['isFunny'] as bool?,
      descriptionJoke: json['descriptionJoke'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$JokeModelToJson(JokeModel instance) => <String, dynamic>{
      'id': instance.id,
      'isFunny': instance.isFunny,
      'descriptionJoke': instance.descriptionJoke,
      'createdAt': instance.createdAt,
    };
