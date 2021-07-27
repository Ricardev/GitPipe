import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gitpipe/core/network_info/network_info.dart';
import 'package:gitpipe/core/states/application_states.dart';
import 'package:gitpipe/features/login/data/datasources/implementation/Login_Remote_Data_Source.dart';
import 'package:gitpipe/features/login/data/datasources/interfaces/ILogin_Remote_Data_Source.dart';
import 'package:gitpipe/features/login/data/repositories/Login_Repository.dart';
import 'package:gitpipe/features/login/domain/repositories/ILogin_repository.dart';
import 'package:gitpipe/features/login/domain/usecases/get_oauth_code.dart';
import 'package:gitpipe/features/login/presentation/bloc/login_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector.registerFactory(() => LoginBloc(
      loginState: ApplicationState.Empty, getAccessTokenUseCase: injector()));

  injector.registerFactory(() => Dio());

  injector.registerLazySingleton(
      () => GetAccessTokenUseCase(iLoginRepository: injector()));

  injector.registerLazySingleton<ILoginRemoteDataSource>(
      () => LoginRemoteDataSource(dio: injector()));

  injector.registerLazySingleton<ILoginRepository>(() => LoginRepository(
      networkInfo: injector(), iLoginRemoteDataSource: injector()));

  injector.registerLazySingleton<INetworkInfo>(() => NetworkInfo());
}
