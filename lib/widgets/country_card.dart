import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/models/country_summary.dart';
import 'package:countries_app/presentation/cubits/home_cubit.dart';
import 'package:countries_app/presentation/cubits/favorites_cubit.dart';

class CountryCard extends StatelessWidget {
  final CountrySummary country;
  final bool isFavorite;
  final VoidCallback onTap;

  const CountryCard({
    super.key,
    required this.country,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isFav = context
        .watch<FavoritesCubit>()
        .state
        .any((c) => c.cca2 == country.cca2);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onTap,
        leading: Hero(
          tag: 'flag_${country.name.common}',
          child: Image.network(country.flags.png, width: 60, fit: BoxFit.cover),
        ),
        title: Text(country.name.common),
        subtitle: Text(
            'Population: ${(country.population / 1000000).toStringAsFixed(1)}M'),
        trailing: IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : null,
          ),
          onPressed: () {
            if (isFavorite) {
              context.read<FavoritesCubit>().toggle(country.cca2);
            } else {
              context.read<HomeCubit>().toggleFavorite(country.cca2);
            }
          },
        ),
      ),
    );
  }
}
