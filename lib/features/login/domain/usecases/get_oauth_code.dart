import 'package:equatable/equatable.dart';
import 'package:gitpipe/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gitpipe/core/usecases/use_case.dart';
import 'package:gitpipe/features/login/domain/entities/login_entity.dart';
import 'package:gitpipe/features/login/domain/repositories/ILogin_repository.dart';
import 'package:oauth2/oauth2.dart';

class GetAccessTokenUseCase implements UseCase<LoginEntity, Params> {
  final ILoginRepository iLoginRepository;
  GetAccessTokenUseCase({required this.iLoginRepository});

  @override
  Future<Either<Failure, LoginEntity>> call(Params params) async {
    return await iLoginRepository.getAuthorizationCode(
        codeChallenge: params.codeChallenge,
        codeVerifier: params.codeVerifier,
        state: params.state,
        returnedUrl: params.returnedUrl,
        client: params.client);
  }
}

class Params extends Equatable {
  String codeChallenge;
  String codeVerifier;
  String state;
  String returnedUrl;
  Client client;
  Params(
      {required this.codeChallenge,
      required this.codeVerifier,
      required this.state,
      required this.returnedUrl,
      required this.client});
  @override
  List<Object?> get props =>
      [codeChallenge, codeVerifier, state, returnedUrl, client];
}
