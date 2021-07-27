import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gitpipe/core/Generator/generator.dart';
import 'package:gitpipe/core/app/app_settings.dart';
import 'package:gitpipe/core/injector/injector.dart';
import 'package:gitpipe/core/states/application_states.dart';
import 'package:gitpipe/features/login/domain/usecases/get_oauth_code.dart';
import 'package:gitpipe/features/login/presentation/bloc/login_bloc.dart';
import 'package:mock_data/mock_data.dart';
import 'package:oauth2/oauth2.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:oauth2/oauth2.dart';

class GitLabView extends StatefulWidget {
  const GitLabView({Key? key}) : super(key: key);

  @override
  _GitLabViewState createState() => _GitLabViewState();
}

class _GitLabViewState extends State<GitLabView> {
  late final LoginBloc loginBloc;
  late Connectivity connectivity;
  late Dio dio;
  late WebViewController _webViewController;
  final codeVerifier = Generator.getRandomString(mockInteger(43, 128));
  final state = GitPipe.state;
  late final code_challenge;
  late final params;
  late final AuthorizationCodeGrant grant;
  var authUrl;

  var authorizationUrl;
  @override
  void initState() {
    grant = AuthorizationCodeGrant(
        GitPipe.appIdentifier,
        Uri.parse(GitPipe.authorizeEndpoint),
        Uri.parse(GitPipe.accessTokenEndpoint),
        secret: GitPipe.secret);

    authUrl = grant.getAuthorizationUrl(Uri.parse(GitPipe.redirectUrl));
    print(authUrl);

    dio = Dio();
    final getAccessTokenUseCase = injector.get<GetAccessTokenUseCase>();
    loginBloc = LoginBloc(
        getAccessTokenUseCase: getAccessTokenUseCase,
        loginState: ApplicationState.Loaded);
    code_challenge = Base64Codec.urlSafe()
        .encode(sha256.convert(utf8.encode(codeVerifier)).bytes);
    params =
        "?client_id=${GitPipe.appIdentifier}&redirect_uri=${GitPipe.redirectUrl}&response_type=code&state=$state&scope=read_api&code_challenge=$code_challenge&code_challenge_method=S256";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: authUrl.toString(),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        _webViewController = controller;
      },
      onPageStarted: (url) async {
        if (url.startsWith(GitPipe.redirectUrl)) {
          Client client = await grant
              .handleAuthorizationResponse(Uri.parse(url).queryParameters);
          await loginBloc.getAccessToken(
              codeChallenge: code_challenge,
              codeVerifier: codeVerifier,
              state: state.toString(),
              returnedUrl: url,
              client: client);
        }
      },
    );
  }
}
