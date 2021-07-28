// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginBloc on _LoginBlocBase, Store {
  final _$loginStateAtom = Atom(name: '_LoginBlocBase.loginState');

  @override
  ApplicationState get loginState {
    _$loginStateAtom.reportRead();
    return super.loginState;
  }

  @override
  set loginState(ApplicationState value) {
    _$loginStateAtom.reportWrite(value, super.loginState, () {
      super.loginState = value;
    });
  }

  final _$getAccessTokenAsyncAction =
      AsyncAction('_LoginBlocBase.getAccessToken');

  @override
  Future<void> getAccessToken(
      {required String returnedUrl, required AuthorizationCodeGrant grant}) {
    return _$getAccessTokenAsyncAction.run(
        () => super.getAccessToken(returnedUrl: returnedUrl, grant: grant));
  }

  @override
  String toString() {
    return '''
loginState: ${loginState}
    ''';
  }
}
