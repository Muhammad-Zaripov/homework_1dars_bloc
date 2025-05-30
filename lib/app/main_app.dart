import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1dars/feature/home/data/repository/product_repository.dart';
import 'package:homework_1dars/feature/home/presentation/bloc/product_bloc.dart';

import '../feature/home/presentation/bloc/product_event.dart';
import '../feature/home/presentation/screens/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductBloc(ProductRepository())..add(LoadProductsEvent()),
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
