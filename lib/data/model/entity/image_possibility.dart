import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_possibility.g.dart';

@JsonSerializable()
class ImagePossibility extends Equatable {
  final String type;
  final String description;

  const ImagePossibility(this.type, this.description);

  factory ImagePossibility.fromJson(Map<String, dynamic> json) =>
      _$ImagePossibilityFromJson(json);

  Map<String, dynamic> toJson() => _$ImagePossibilityToJson(this);

  @override
  List<Object?> get props => [type, description];
}
