import 'package:dartz/dartz.dart';
import 'package:gitpipe/core/error/failures.dart';
import 'package:gitpipe/features/login/domain/entities/login_entity.dart';
import 'package:oauth2/oauth2.dart';

abstract class ILoginRepository {
  Future<Either<Failure, LoginEntity>> getAuthorizationCode(
      {required String codeChallenge,
      required String codeVerifier,
      required String state,
      required String returnedUrl,
      required Client client});
}
