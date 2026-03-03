import 'package:get_it/get_it.dart';
import 'package:countries_app/data/repositories/country_repository.dart';
import 'package:countries_app/presentation/cubits/home_cubit.dart';
import 'package:countries_app/presentation/cubits/favorites_cubit.dart';
import 'package:countries_app/presentation/cubits/country_detail_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<CountryRepository>(() => CountryRepository());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt()));
  getIt.registerFactoryParam<CountryDetailCubit, String, void>(
    (cca2, _) => CountryDetailCubit(getIt(), cca2),
  );
}
