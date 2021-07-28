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
        returnedUrl: params.returnedUrl, grant: params.grant);
  }
}

class Params extends Equatable {
  final String returnedUrl;
  final AuthorizationCodeGrant grant;
  Params({required this.returnedUrl, required this.grant});
  @override
  List<Object?> get props => [returnedUrl, grant];
}
