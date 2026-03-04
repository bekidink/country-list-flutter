import 'package:countries_app/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/core/di/injection.dart';
import 'package:countries_app/presentation/cubits/home_cubit.dart';
import 'package:countries_app/presentation/cubits/favorites_cubit.dart';
import 'screens/main_screen.dart';

class CountriesApp extends StatelessWidget {
  const CountriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeCubit>()..loadCountries()),
        BlocProvider(create: (_) => getIt<FavoritesCubit>()),
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()), // ← critical
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Countries',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: themeState.mode,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
