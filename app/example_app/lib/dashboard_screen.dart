import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Dashboard')),
    body: const Center(
      child: Text('Welcome to the Dashboard!', style: AppTypography.h1),
    ),
  );
}
