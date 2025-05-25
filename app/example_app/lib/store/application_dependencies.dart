import 'package:dependency_injection/dependency_injection.dart';
import 'package:example_app/store/application_store.dart';
import 'package:example_app/store/dashboard_store.dart';
import 'package:flutter/widgets.dart';
import 'package:storage/general_storage.dart';
import 'package:storage/secure_storage.dart';
import 'package:user_state/user_state.dart';

class ApplicationDependencies extends StatefulWidget {
  const ApplicationDependencies({required Widget child, super.key})
    : _child = child;

  final Widget _child;

  @override
  State<ApplicationDependencies> createState() =>
      _ApplicationDependenciesState();
}

class _ApplicationDependenciesState extends State<ApplicationDependencies>
    with DependencyScope {
  @override
  void registerDependencies() {
    locator
      ..registerSingleton<GeneralStorage>(GeneralStorage())
      ..registerSingleton<SecureStorage>(SecureStorage())
      ..registerSingleton<CurrentUserState>(CurrentUserState())
      ..registerSingleton(ApplicationStore()..initialize())
      ..registerSingleton<DashboardStore>(DashboardStore()..load());
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
