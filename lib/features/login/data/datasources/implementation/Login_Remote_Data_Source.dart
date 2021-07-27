import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:gitpipe/core/app/app_settings.dart';
import 'package:gitpipe/features/login/data/datasources/interfaces/ILogin_Remote_Data_Source.dart';
import 'package:gitpipe/features/login/data/models/Login_Model.dart';
import 'package:gitpipe/features/login/domain/entities/login_entity.dart';
import 'package:oauth2/oauth2.dart';

// ignore_for_file: cancel_subscriptions

class LoginRemoteDataSource implements ILoginRemoteDataSource {
  final Dio dio;
  LoginRemoteDataSource({required this.dio});

  @override
  Future<LoginEntity> getAccessToken(
      {required String codeChallenge,
      required String codeVerifier,
      required String state,
      required String returnedUrl,
      required Client client}) async {
    List<String> urlParts = returnedUrl.split('code=');
    String code = urlParts.last;

    String parameters = """?client_id=${GitPipe.appIdentifier}&
        client_secret=${GitPipe.secret}&
        code=$code&
        grant_type=${GrantType.authorizationCode}&
        redirect_uri=${GitPipe.redirectUrl}&
        code_verifier=$codeVerifier""";
    Uri tokenUrl = Uri.parse(GitPipe.accessTokenEndpoint + parameters);
    Options options = Options();
    late final Response responseAccessToken;

    Map<String, dynamic> token = {
      "access_token": client.credentials.accessToken,
      "refresh_token": client.credentials.refreshToken,
      "token_type": 'bearer',
      "created_at": "1607635748",
      "expires_in": "7200"
    };

    return LoginModel.fromJson(token);
  }
}
