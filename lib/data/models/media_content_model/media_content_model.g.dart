// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaContentModel _$MediaContentModelFromJson(Map<String, dynamic> json) =>
    MediaContentModel(
      type: json['type'] as String,
      sourceUrl: json['sourceUrl'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$MediaContentModelToJson(MediaContentModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sourceUrl': instance.sourceUrl,
      'thumbnail': instance.thumbnail,
    };
