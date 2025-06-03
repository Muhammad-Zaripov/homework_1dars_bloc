import 'package:get_it/get_it.dart';
import 'package:homework_1dars/feature/auth/data/repository/auth_repository.dart';
import 'package:homework_1dars/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:homework_1dars/feature/home/data/repository/product_repository.dart';
import 'package:homework_1dars/feature/home/presentation/bloc/product_bloc.dart';

final GetIt getIt = GetIt.instance;
Future<void> dp() async {
  getIt.registerLazySingleton(() => AuthRepository());
  getIt.registerFactory(
    () => AuthBloc(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(() => ProductRepository());
  getIt.registerFactory(() => ProductBloc(getIt<ProductRepository>()));
}
