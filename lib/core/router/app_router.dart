import 'package:go_router/go_router.dart';
import 'package:homework_1dars/feature/home/presentation/screens/home_screen.dart';

import '../../feature/auth/presentation/screens/login_screen.dart';
import '../../feature/auth/presentation/screens/register_screen.dart';
import '../../feature/auth/presentation/screens/start_screen.dart';
import 'app_rotes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRotes.start,
  routes: [
    GoRoute(
      path: AppRotes.start,
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: AppRotes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRotes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRotes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
