import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitpipe/app_module.dart';
import 'package:gitpipe/app_widget.dart';
import 'package:gitpipe/core/app/app_settings.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'core/injector/injector.dart' as injector;

void main() async {
  await injector.init();
  await Parse().initialize(GitPipe.keyApplicationId, GitPipe.keyParseServerUrl,
      clientKey: GitPipe.keyClientKey, autoSendSessionId: true);

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
