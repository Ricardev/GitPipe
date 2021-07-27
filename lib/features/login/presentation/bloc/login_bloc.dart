import 'package:flutter/cupertino.dart';
import 'package:gitpipe/core/cache/logged_user.dart';
import 'package:gitpipe/core/states/application_states.dart';
import 'package:gitpipe/features/login/domain/entities/login_entity.dart';
import 'package:gitpipe/features/login/domain/usecases/get_oauth_code.dart';
import 'package:mobx/mobx.dart';
import 'package:oauth2/oauth2.dart';

part 'login_bloc.g.dart';

class LoginBloc = _LoginBlocBase with _$LoginBloc;

abstract class _LoginBlocBase with Store {
  _LoginBlocBase(
      {required this.loginState, required this.getAccessTokenUseCase});

  final GetAccessTokenUseCase getAccessTokenUseCase;

  @observable
  ApplicationState loginState;

  @action
  Future<void> getAccessToken(
      {required String codeChallenge,
      required String codeVerifier,
      required String state,
      required String returnedUrl,
      required Client client}) async {
    loginState = ApplicationState.Loading;
    final failureOrLoginEntity = await getAccessTokenUseCase(Params(
        codeChallenge: codeChallenge,
        codeVerifier: codeVerifier,
        state: state,
        returnedUrl: returnedUrl,
        client: client));
    failureOrLoginEntity.fold((failure) => throw UnimplementedError(),
        (loginEntity) {
      LoggedUser.current().loginCredentials = loginEntity;
      loginState = ApplicationState.Loaded;
    });
  }
}
