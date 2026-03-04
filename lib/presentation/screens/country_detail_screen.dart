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
      child: BlocBuilder<CountryDetailCubit, CountryDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state is CountryDetailSuccess
                    ? state.details.name.common
                    : 'Country Details',
              ),
              centerTitle: true,
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, CountryDetailState state) {
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
            /// Hero Flag
            Hero(
              tag: 'flag_$cca2',
              transitionOnUserGestures: true,
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                return Image.network(
                  d.flags.png,
                  fit: BoxFit.cover,
                );
              },
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

            /// Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   "Key Statistics",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  _buildStat(
                    context,
                    'Population',
                    '${(d.population / 1000000).toStringAsFixed(1)}M',
                  ),
                  _buildStat(
                    context,
                    'Area',
                    '${d.area.toStringAsFixed(0)} km²',
                  ),
                  _buildStat(
                    context,
                    'Region', d.region),
                  _buildStat(
                    context,
                    'Subregion', d.subregion),
                  _buildStat(
                    context,
                    'Capital',
                    d.capital.isNotEmpty ? d.capital.first : 'N/A',
                  ),
                  const SizedBox(height: 24),
                 const Text(
                    'Timezones',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: d.timezones.map((tz) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            tz,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildStat(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0.3,
      color: theme.brightness == Brightness.light
          ? const Color(0xFFFFFFFF) // 👈 soft grey in light mode
          : theme.colorScheme.surface,
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
