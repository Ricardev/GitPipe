import 'dart:io';
import 'dart:math';

import 'package:gitpipe/features/login/domain/entities/login_entity.dart';
import 'package:oauth2/oauth2.dart';

abstract class ILoginRemoteDataSource {
  Future<LoginEntity> getAccessToken(
      {required String returnedUrl, required AuthorizationCodeGrant grant});
}
