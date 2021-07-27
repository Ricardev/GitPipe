import 'package:gitpipe/features/login/domain/entities/login_entity.dart';

class LoggedUser {
  LoggedUser._internal();

  static final LoggedUser _loggedUser = LoggedUser._internal();

  static LoggedUser current() => _loggedUser;

  late LoginEntity _loginEntity;

  LoginEntity get session => _loginEntity;

  set loginCredentials(LoginEntity loginEntity) => _loginEntity = loginEntity;
}
