import 'package:json_annotation/json_annotation.dart';
import 'package:upt_test/data/models/media_content_model/media_content_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey()
  final String id;

  @JsonKey()
  final String name;

  @JsonKey()
  String? profilePic;

  @JsonKey()
  String? description;

  @JsonKey()
  String? country;

  @JsonKey()
  String? schedule;

  @JsonKey()
  List<MediaContentModel> uploads;

  UserModel({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.description,
    required this.country,
    required this.schedule,
    required this.uploads,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}