import 'package:core_module/core_module.dart';
import 'package:dartz/dartz.dart';
import 'package:my_recipes_application/src/modules/categories/domain/models/category_model.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_interface.dart';

import '../../external/datasource/get_category_datasource_interface.dart';

class GetCategoryUsecase implements GetCategoryUsecaseInterface {
  final GetCategoryDatasourceInterface datasource;
  GetCategoryUsecase(this.datasource);

  @override
  Future<Either<ApplicationError, List<CategoryModel>>> call() async {
    final result = await datasource.call();
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
