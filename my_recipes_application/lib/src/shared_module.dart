import 'package:core_module/core_module.dart';

final class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<HttpServiceInterface>(DioHttpServiceAdapter.new);
  }
}
