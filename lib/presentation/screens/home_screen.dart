import 'dart:async';

import 'package:countries_app/core/theme/theme_cubit.dart';
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
  Timer? _debounce;
  String _sortBy = 'name';

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<HomeCubit>().search(query.trim());
    });
  }

  Future<void> _handleRefresh() async {
    await context.read<HomeCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Countries'),
        elevation: 0,
        centerTitle: true,
        actions: [
          // Sort selector
          PopupMenuButton<String>(
            offset: const Offset(0, 50),
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _sortBy == 'name' ? Icons.sort_by_alpha : Icons.trending_up,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  _sortBy == 'name' ? 'Name' : 'Population',
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
                const Icon(Icons.arrow_drop_down, size: 20),
              ],
            ),
            onSelected: (value) {
              setState(() => _sortBy = value);
              context.read<HomeCubit>().sort(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'name',
                child: ListTile(
                  leading: const Icon(Icons.sort_by_alpha),
                  title: const Text('Sort by Name'),
                  selected: _sortBy == 'name',
                ),
              ),
              PopupMenuItem(
                value: 'population',
                child: ListTile(
                  leading: const Icon(Icons.trending_up),
                  title: const Text('Sort by Population'),
                  selected: _sortBy == 'population',
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),

          // Theme toggle
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              IconData icon = Icons.brightness_auto;
              if (state.mode == ThemeMode.light)
                icon = Icons.dark_mode_outlined;
              if (state.mode == ThemeMode.dark)
                icon = Icons.light_mode_outlined;

              return IconButton(
                icon: Icon(icon),
                tooltip: 'Toggle theme',
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: _handleRefresh,
        color: theme.colorScheme.primary,
        backgroundColor: theme.colorScheme.surface,
        displacement: 60,
        strokeWidth: 3,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // Search bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: SearchBar(
                  controller: _searchController,
                  leading: const Icon(Icons.search_rounded),
                  hintText: 'Search for a country...',
                  elevation: const MaterialStatePropertyAll(3),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  
                  onChanged: _onSearchChanged,
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  ),
                ),
              ),
            ),

            // Continent filter chips
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: context.select<HomeCubit, bool>(
                          (cubit) =>
                              cubit.state is HomeSuccess &&
                              (cubit.state as HomeSuccess).selectedContinent ==
                                  null,
                        ),
                        onSelected: (_) =>
                            context.read<HomeCubit>().filterByContinent(null),
                        selectedColor: theme.colorScheme.primaryContainer,
                      ),
                      const SizedBox(width: 8),
                      ...['Africa', 'Americas', 'Asia', 'Europe', 'Oceania']
                          .map((continent) {
                        final isSelected = context.select<HomeCubit, bool>(
                          (cubit) =>
                              cubit.state is HomeSuccess &&
                              (cubit.state as HomeSuccess).selectedContinent ==
                                  continent,
                        );

                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(continent),
                            selected: isSelected,
                            onSelected: (selected) {
                              context.read<HomeCubit>().filterByContinent(
                                    selected ? continent : null,
                                  );
                            },
                            selectedColor: theme.colorScheme.primaryContainer,
                            checkmarkColor:
                                theme.colorScheme.onPrimaryContainer,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),

            // Content
            SliverFillRemaining(
              hasScrollBody: true,
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
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 96,
                              color: theme.colorScheme.outline.withOpacity(0.6),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'No countries found',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Try changing your search or filter',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      itemCount: state.filtered.length,
                      itemBuilder: (context, index) {
                        final country = state.filtered[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: CountryCard(
                            country: country,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    CountryDetailScreen(cca2: country.cca2),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
