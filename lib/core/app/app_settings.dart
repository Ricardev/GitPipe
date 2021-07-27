import 'dart:io';
import 'dart:math';

class GitPipe {
  static final _randomState = Random.secure();

  static final state = _randomState;

  static final keyApplicationId = 'B6xpYRc71CbH8jKFV0hBIwVwdkIUWbvLrhm2ScV3';
  static final keyClientKey = 'sDtaPCiYRQ9n30M3ci3pTC3yw464KYjgsXJpYaNO';
  static final keyParseServerUrl = 'https://parseapi.back4app.com';
  static final secret =
      'a5962e25cf432474577f515b309d0551f04ef03b3f8c53ff8a1962ab67b7c4cc';
  static final appIdentifier =
      'e0013359b4bc89d6d7c66163791fe3524e376025916a1f4acf7500f569b27223';
  static final redirectUrl = 'https://parseapi.back4app.com/gitpipe';
  static final credentialsFile = File('~/.myapp/credentials.json');
  static final accessTokenEndpoint = 'https://gitlab.com/oauth/token';
  static final authorizeEndpoint = 'https://gitlab.com/oauth/authorize';
}
