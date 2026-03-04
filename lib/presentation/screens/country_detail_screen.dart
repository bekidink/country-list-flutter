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
        appBar: AppBar(
          title: Text('Country Details'),
          centerTitle: true,
        ),
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
                child: Column(
                  children: [
                    Hero(
                      tag: 'flag_$cca2',
                      child: Image.network(
                        d.flags.png,
                        height: 260,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 260,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.flag, size: 100),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            d.name.common,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 24),
                          _buildStat('Population',
                              '${(d.population / 1000000).toStringAsFixed(1)}M'),
                          _buildStat(
                              'Area', '${d.area.toStringAsFixed(0)} km²'),
                          _buildStat('Region', d.region),
                          _buildStat('Subregion', d.subregion),
                          _buildStat('Capital',
                              d.capital.isNotEmpty ? d.capital.first : 'N/A'),
                          const SizedBox(height: 24),
                          const Text(
                            'Timezones',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          ...d.timezones.map(
                            (tz) => ListTile(title: Text(tz), dense: true),
                          ),
                        ],
                      ),
                    ),
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

  Widget _buildStat(String label, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(label),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
