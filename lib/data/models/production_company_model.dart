import '../../domain/entities/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  const ProductionCompanyModel(
      {required super.id,
      required super.logoPath,
      required super.name,
      required super.originCountry});

  static List<ProductionCompanyModel> from(List<dynamic> json) {
    return json.map((e) => ProductionCompanyModel.fromJson(e)).toList();
  }
}
