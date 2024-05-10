import 'package:json_annotation/json_annotation.dart';

part 'media_content_model.g.dart';

@JsonSerializable()
class MediaContentModel {

  @JsonKey()
  final String type;

  @JsonKey()
  final String sourceUrl;

  @JsonKey()
  final String thumbnail;

  MediaContentModel({
    required this.type,
    required this.sourceUrl,
    required this.thumbnail,
  });

  factory MediaContentModel.fromJson(Map<String, dynamic> json) {
    return _$MediaContentModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MediaContentModelToJson(this);
  }
}