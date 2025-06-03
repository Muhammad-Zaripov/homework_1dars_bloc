import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_1dars/core/router/app_rotes.dart';
import '../../../../core/di/dpi.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwortController = TextEditingController();
  void _login() {
    final email = emailController.text.trim();
    final password = passwortController.text.trim();
    context.read<AuthBloc>().add(
      LoginRequestEvent(email: email, password: password),
    );
    context.go(AppRotes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                Text('Login Account', style: TextStyle(fontSize: 30)),
                SizedBox(height: 300),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwortController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Login successful")));

            context.go('/home');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _login,
        child: Text('Login'),
      ),
    );
  }
}
