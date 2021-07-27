import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitpipe/features/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: LoginModule())];
}
