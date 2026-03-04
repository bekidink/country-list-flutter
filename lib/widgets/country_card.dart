import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/models/country_summary.dart';
import 'package:countries_app/presentation/cubits/favorites_cubit.dart';

class CountryCard extends StatelessWidget {
  final CountrySummary country;
  final VoidCallback onTap;

  const CountryCard({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isFav = context
        .watch<FavoritesCubit>()
        .state
        .any((c) => c.cca2 == country.cca2);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Hero(
          tag: 'flag_${country.cca2}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              country.flags.png,
              width: 68,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.flag_outlined),
            ),
          ),
        ),
        title: Text(
          country.name.common,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Population: ${(country.population / 1000000).toStringAsFixed(1)}M',
        ),
        trailing: IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : null,
          ),
          onPressed: () {
            // Single source of truth → always use FavoritesCubit
            context.read<FavoritesCubit>().toggle(country.cca2);
          },
        ),
      ),
    );
  }
}
