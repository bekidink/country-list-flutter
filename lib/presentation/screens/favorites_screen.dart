import 'package:countries_app/data/models/country_summary.dart';
import 'package:countries_app/presentation/screens/country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/presentation/cubits/favorites_cubit.dart';
import 'package:countries_app/widgets/country_card.dart';
import 'package:countries_app/widgets/error_retry.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: BlocBuilder<FavoritesCubit, List<CountrySummary>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites yet ❤️'));
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, i) {
              final c = favorites[i];
              return CountryCard(
                country: c,
               
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CountryDetailScreen(cca2: c.cca2),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
