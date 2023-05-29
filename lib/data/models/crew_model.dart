import 'package:mova/domain/entities/crew_entity.dart';

class CrewModel extends CrewEntity {
  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'] ?? '',
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }
  const CrewModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.profilePath,
    required super.creditId,
    required super.department,
    required super.job,
  });

  static List<CrewModel> from(List<dynamic> json) =>
      json.map((e) => CrewModel.fromJson(e)).toList();
}
