import 'package:core_module/core_module.dart';
import 'package:dartz/dartz.dart';

import 'package:my_recipes_application/src/modules/categories/domain/models/category_model.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource_interface.dart';

import '../../../error/datasource_error.dart';

class GetCategoryDatasource implements GetCategoryDatasourceInterface {
  final DioServiceInterface dio;
  GetCategoryDatasource({
    required this.dio,
  });
  @override
  Future<Either<ApplicationError, List<CategoryModel>>> call() async {
    const String url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    ServiceInformation result = await dio.get(url);
    if (result.statusCode == 400) {
      throw DatasourceError(
        message: 'Client error conection',
        stackTrace: StackTrace.current,
      );
    }
    if (result.statusCode == 500) {
      throw DatasourceError(
        message: 'Server error conection',
        stackTrace: StackTrace.current,
      );
    }
    var resultFinal = result.data;
    return Right(
        resultFinal["categories"].map<CategoryModel>((e) => CategoryModel.fromMap(e)).toList());
  }
}
