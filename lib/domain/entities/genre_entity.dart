import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

  const GenreEntity({required this.id, required this.name});

  factory GenreEntity.fromJson(Map<String, dynamic> json) {
    return GenreEntity(id: json['id'], name: json['name']);
  }
}
