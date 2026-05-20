// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core_module/core_module.dart';

base class CategoryEntity extends Equatable {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  const CategoryEntity({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  @override
  List<Object?> get props {
    return [
      idCategory,
      strCategory,
      strCategoryThumb,
      strCategoryDescription,
    ];
  }

  // @override
  // bool operator ==(covariant CategoryEntity other) {
  //   if (identical(this, other)) return true;

  //   return other.idCategory == idCategory && other.strCategory == strCategory && other.strCategoryThumb == strCategoryThumb && other.strCategoryDescription == strCategoryDescription;
  // }

  // @override
  // int get hashCode {
  //   return idCategory.hashCode ^ strCategory.hashCode ^ strCategoryThumb.hashCode ^ strCategoryDescription.hashCode;
  // }
}
