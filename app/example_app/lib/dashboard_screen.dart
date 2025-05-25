import 'package:dependency_injection/dependency_injection.dart';
import 'package:design_system/design_system.dart';
import 'package:example_app/store/dashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardStore _store = locator<DashboardStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Dashboard')),
    body: Center(
      child: Observer(
        builder: (_) {
          final user = _store.currentUser;
          if (user == null) {
            return const Text('No user logged in', style: AppTypography.h1);
          }
          return Text('Welcome, ${user.name}!', style: AppTypography.h1);
        },
      ),
    ),
  );
}
