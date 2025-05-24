import 'package:dependency_injection/src/locator.dart';
import 'package:flutter/widgets.dart';

mixin DependencyScope<T extends StatefulWidget> on State<T> {
  String get _scopeName => (T).toString();

  @override
  void initState() {
    super.initState();
    if (!locator.hasScope(_scopeName)) {
      locator.pushNewScope(scopeName: _scopeName);
      registerDependencies();
    }
  }

  void registerDependencies();

  @override
  @mustCallSuper
  void dispose() {
    locator.dropScope(_scopeName);
    super.dispose();
  }
}
