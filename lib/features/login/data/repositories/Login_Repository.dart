import 'package:connectivity/connectivity.dart';
import 'package:gitpipe/core/error/exceptions.dart';
import 'package:gitpipe/core/network_info/network_info.dart';
import 'package:gitpipe/features/login/data/datasources/interfaces/ILogin_Remote_Data_Source.dart';
import 'package:gitpipe/features/login/domain/entities/login_entity.dart';
import 'package:gitpipe/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gitpipe/features/login/domain/repositories/ILogin_repository.dart';
import 'package:oauth2/oauth2.dart';

class LoginRepository implements ILoginRepository {
  final INetworkInfo networkInfo;
  final ILoginRemoteDataSource iLoginRemoteDataSource;
  LoginRepository(
      {required this.networkInfo, required this.iLoginRemoteDataSource});
  @override
  Future<Either<Failure, LoginEntity>> getAuthorizationCode(
      {required String codeChallenge,
      required String codeVerifier,
      required String state,
      required String returnedUrl,
      required Client client}) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final accessToken = await iLoginRemoteDataSource.getAccessToken(
            codeChallenge: codeChallenge,
            codeVerifier: codeVerifier,
            state: state,
            returnedUrl: returnedUrl,
            client: client);
        return Right(accessToken);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
