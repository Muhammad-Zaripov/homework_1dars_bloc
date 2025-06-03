import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1dars/core/router/app_router.dart';
import 'package:homework_1dars/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:homework_1dars/feature/home/presentation/bloc/product_event.dart';

import '../core/di/dpi.dart';
import '../feature/home/presentation/bloc/product_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(
          create: (context) => getIt<ProductBloc>()..add(LoadProductsEvent()),
        ),
      ],

      child: MaterialApp.router(routerConfig: router),
    );
  }
}
