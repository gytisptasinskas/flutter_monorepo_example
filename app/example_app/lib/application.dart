import 'package:authentication/authentication.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:design_system/design_system.dart';
import 'package:example_app/dashboard_screen.dart';
import 'package:example_app/store/application_dependencies.dart';
import 'package:example_app/store/application_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) =>
      const ApplicationDependencies(child: _ApplicationBase());
}

class _ApplicationBase extends StatefulWidget {
  const _ApplicationBase();

  @override
  State<_ApplicationBase> createState() => __ApplicationBaseState();
}

class __ApplicationBaseState extends State<_ApplicationBase> {
  final ApplicationStore _store = locator<ApplicationStore>();

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: AppTheme.light,
    home: Observer(
      builder: (_) {
        if (!_store.isInitialized) {
          return const Center(child: CircularProgressIndicator());
        }
        return _store.isAuthenticated
            ? const DashboardScreen()
            : const LoginScreen();
      },
    ),
  );
}
