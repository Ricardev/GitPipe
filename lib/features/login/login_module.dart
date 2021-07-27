import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitpipe/core/injector/injector.dart';
import 'package:gitpipe/features/login/presentation/bloc/login_bloc.dart';
import 'package:gitpipe/features/login/presentation/pages/git_web_view_page.dart';
import 'package:gitpipe/features/login/presentation/pages/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginBloc(
            getAccessTokenUseCase: injector(), loginState: injector()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('', child: (_, args) => LoginPage()),
        ChildRoute('/webview', child: (_, args) => GitLabView())
      ];
}
