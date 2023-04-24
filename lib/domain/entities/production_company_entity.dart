import 'package:equatable/equatable.dart';

class ProductionCompanyEntity extends Equatable {
  final int id;
  final String? logoPath;
  final String name;
  final String? originCountry;

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];

  const ProductionCompanyEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
}
