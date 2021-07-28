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
      {required String returnedUrl,
      required AuthorizationCodeGrant grant}) async {
    Client client = await grant
        .handleAuthorizationResponse(Uri.parse(returnedUrl).queryParameters);

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
