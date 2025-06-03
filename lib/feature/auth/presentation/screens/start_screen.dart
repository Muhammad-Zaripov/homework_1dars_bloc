import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_rotes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          spacing: 100,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.go('/login');
              },
              child: Text('Login'),
            ),
            FloatingActionButton(
              onPressed: () {
                context.go(AppRotes.login);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
