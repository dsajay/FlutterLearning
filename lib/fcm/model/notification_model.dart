
import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';


@JsonSerializable()
class NotificationModel{
  final String? id;
  final String? name;
  NotificationModel({required this.id, required this.name});

  factory NotificationModel.fromJson(Map<String,dynamic> json) => _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
