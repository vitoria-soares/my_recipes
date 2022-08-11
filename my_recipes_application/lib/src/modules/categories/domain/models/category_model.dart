import 'dart:convert';

class CategoryModel {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;
  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  CategoryModel copyWith({
    String? idCategory,
    String? strCategory,
    String? strCategoryThumb,
    String? strCategoryDescription,
  }) {
    return CategoryModel(
      idCategory: idCategory ?? this.idCategory,
      strCategory: strCategory ?? this.strCategory,
      strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
      strCategoryDescription: strCategoryDescription ?? this.strCategoryDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCategory': idCategory,
      'strCategory': strCategory,
      'strCategoryThumb': strCategoryThumb,
      'strCategoryDescription': strCategoryDescription,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      idCategory: map['idCategory'] ?? '',
      strCategory: map['strCategory'] ?? '',
      strCategoryThumb: map['strCategoryThumb'] ?? '',
      strCategoryDescription: map['strCategoryDescription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, strCategoryDescription: $strCategoryDescription)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.idCategory == idCategory &&
        other.strCategory == strCategory &&
        other.strCategoryThumb == strCategoryThumb &&
        other.strCategoryDescription == strCategoryDescription;
  }

  @override
  int get hashCode {
    return idCategory.hashCode ^
        strCategory.hashCode ^
        strCategoryThumb.hashCode ^
        strCategoryDescription.hashCode;
  }
}
