import 'package:equatable/equatable.dart';
import 'package:gitpipe/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  final String accessToken;
  final String tokenType;
  final int expires;
  final String refreshToken;
  final int createdAt;

  LoginModel(
      {required this.accessToken,
      required this.createdAt,
      required this.expires,
      required this.refreshToken,
      required this.tokenType})
      : super(
            accessToken: accessToken,
            createdAt: createdAt,
            expires: expires,
            refreshToken: refreshToken,
            tokenType: tokenType);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        accessToken: json['access_token'],
        createdAt: json['created_at'],
        expires: json['expires_in'],
        refreshToken: json['refresh_token'],
        tokenType: json['token_type']);
  }
}
