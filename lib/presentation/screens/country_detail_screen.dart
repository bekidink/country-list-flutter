import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/core/di/injection.dart';
import 'package:countries_app/presentation/cubits/country_detail_cubit.dart';
import 'package:countries_app/widgets/error_retry.dart';

class CountryDetailScreen extends StatelessWidget {
  final String cca2;
  const CountryDetailScreen({super.key, required this.cca2});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CountryDetailCubit>(param1: cca2)..load(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Country Details')),
        body: BlocBuilder<CountryDetailCubit, CountryDetailState>(
          builder: (context, state) {
            if (state is CountryDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CountryDetailError) {
              return ErrorRetry(
                message: state.message,
                onRetry: () => context.read<CountryDetailCubit>().load(),
              );
            }
            if (state is CountryDetailSuccess) {
              final d = state.details;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Hero(
                      tag: 'flag_${d.name.common}',
                      child: Image.network(
                        d.flags.png,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      d.name.common,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 30),
                    _buildStatCard('Population', d.population.toString()),
                    _buildStatCard('Area', '${d.area.toStringAsFixed(0)} km²'),
                    _buildStatCard('Region', d.region),
                    _buildStatCard('Subregion', d.subregion),
                    _buildStatCard('Capital', d.capital.first),
                    const SizedBox(height: 20),
                    const Text('Timezones',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    ...d.timezones.map((tz) => ListTile(title: Text(tz))),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(label),
        trailing:
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
