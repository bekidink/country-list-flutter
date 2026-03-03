import 'package:countries_app/presentation/screens/country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/presentation/cubits/home_cubit.dart';
import 'package:countries_app/widgets/country_card.dart';
import 'package:countries_app/widgets/shimmer_list.dart';
import 'package:countries_app/widgets/error_retry.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _sortBy = 'name';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() => _sortBy = value);
              context.read<HomeCubit>().sort(value);
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'name', child: Text('Sort by Name')),
              const PopupMenuItem(
                  value: 'population', child: Text('Sort by Population')),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<HomeCubit>().refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search for a country...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (q) => context.read<HomeCubit>().search(q),
              ),
            ),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const ShimmerList();
                  }
                  if (state is HomeError) {
                    return ErrorRetry(
                      message: state.message,
                      onRetry: () => context.read<HomeCubit>().loadCountries(),
                    );
                  }
                  if (state is HomeSuccess) {
                    if (state.filtered.isEmpty) {
                      return const Center(child: Text('No countries found.'));
                    }
                    return ListView.builder(
                      itemCount: state.filtered.length,
                      itemBuilder: (context, i) {
                        final country = state.filtered[i];
                        return CountryCard(
                          country: country,
                          isFavorite: false, // heart handled inside
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  CountryDetailScreen(cca2: country.cca2),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
