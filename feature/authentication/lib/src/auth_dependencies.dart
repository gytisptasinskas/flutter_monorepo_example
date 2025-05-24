import 'package:authentication/src/misc/mapper/auth_mapper.dart';
import 'package:authentication/src/misc/network/auth_service.dart';
import 'package:authentication/src/misc/repository/auth_repository.dart';
import 'package:authentication/src/misc/use_case/auth_use_case.dart';
import 'package:authentication/src/store/auth_store.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter/widgets.dart';
import 'package:storage/general_storage.dart';

class AuthDependencies extends StatefulWidget {
  const AuthDependencies({required Widget child, super.key}) : _child = child;

  final Widget _child;

  @override
  State<AuthDependencies> createState() => _AuthDependenciesState();
}

class _AuthDependenciesState extends State<AuthDependencies>
    with DependencyScope {
  @override
  void registerDependencies() {
    locator
      ..registerSingleton<GeneralStorage>(GeneralStorage())
      ..registerSingleton(AuthService())
      ..registerSingleton(AuthMapper())
      ..registerSingleton(AuthRepository())
      ..registerSingleton(AuthUseCase())
      ..registerSingleton(AuthStore());
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
