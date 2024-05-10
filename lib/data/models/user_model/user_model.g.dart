// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePic: json['profilePic'] as String?,
      description: json['description'] as String?,
      country: json['country'] as String?,
      schedule: json['schedule'] as String?,
      uploads: (json['uploads'] as List<dynamic>)
          .map((e) => MediaContentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePic': instance.profilePic,
      'description': instance.description,
      'country': instance.country,
      'schedule': instance.schedule,
      'uploads': instance.uploads.map((e) => e.toJson()).toList(),
    };
