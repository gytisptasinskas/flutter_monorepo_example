import 'package:dependency_injection/dependency_injection.dart';
import 'package:example_app/store/application_store.dart';
import 'package:flutter/widgets.dart';
import 'package:storage/general_storage.dart';

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
      ..registerSingleton(ApplicationStore()..initialize());
  }

  @override
  Widget build(BuildContext context) => widget._child;
}
