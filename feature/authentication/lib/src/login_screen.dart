import 'package:authentication/src/auth_dependencies.dart';
import 'package:authentication/src/store/auth_store.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const AuthDependencies(child: _LoginScreenBase());
}

class _LoginScreenBase extends StatefulWidget {
  const _LoginScreenBase();

  @override
  State<_LoginScreenBase> createState() => __LoginScreenBaseState();
}

class __LoginScreenBaseState extends State<_LoginScreenBase> {
  final AuthStore _store = locator<AuthStore>();
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: Observer(
      builder:
          (context) => Center(
            child: PrimaryButton(
              onPressed: _store.login,
              text: 'Login',
              isLoading: _store.isLoading,
            ),
          ),
    ),
  );
}
