import '../../domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
