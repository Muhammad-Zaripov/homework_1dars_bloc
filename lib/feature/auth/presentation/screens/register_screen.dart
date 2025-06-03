import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_1dars/core/router/app_rotes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Text('Creat Account', style: TextStyle(fontSize: 30)),
            SizedBox(height: 300),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(AppRotes.home);
        },
        child: Text('Creat'),
      ),
    );
  }
}
