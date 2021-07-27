import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gitpipe/core/injector/injector.dart';
import 'package:gitpipe/core/states/application_states.dart';
import 'package:gitpipe/features/login/domain/usecases/get_oauth_code.dart';
import 'package:gitpipe/features/login/presentation/bloc/login_bloc.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Provider<LoginBloc>(
            create: (_) => injector<LoginBloc>(),
            child: TextButton(
                onPressed: () async {
                  Modular.to.navigate('/webview');
                },
                child: Text('Login'))),
      ),
    );
  }
}
