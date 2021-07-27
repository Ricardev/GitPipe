import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String accessToken;
  final String tokenType;
  final int expires;
  final String refreshToken;
  final int createdAt;

  LoginEntity(
      {required this.accessToken,
      required this.createdAt,
      required this.expires,
      required this.refreshToken,
      required this.tokenType});

  @override
  List<Object> get props =>
      [accessToken, createdAt, expires, refreshToken, tokenType];
}
