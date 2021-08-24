import 'dart:io';
import 'dart:math';

class GitPipe {
  static final _randomState = Random.secure();

  static final state = _randomState;

  static final keyApplicationId = 'your App Id';
  static final keyClientKey = 'your App Client Key';
  static final secret =
      'your app secret';
  static final appIdentifier =
      'your app Id ( one Id is from the back4App and the other one is from GitLab. Only the id from GitLab is necessary, but i want to join both later )';
  static final redirectUrl = 'the redirect Url';
  static final credentialsFile = File('~/.myapp/credentials.json');
  static final accessTokenEndpoint = 'your endpoint';
  static final authorizeEndpoint = 'your authorize endpoint';
}
