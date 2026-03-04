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
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  String _sortBy = 'name';

  @override
  void initState() {
    super.initState();
    // Auto focus + show cursor when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _focusNode.dispose();
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
        title: const Text('Countries'),
        centerTitle: true,
        elevation: 0,
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              IconData icon = Icons.brightness_auto;
              if (state.mode == ThemeMode.light)
                icon = Icons.dark_mode_outlined;
              if (state.mode == ThemeMode.dark)
                icon = Icons.light_mode_outlined;

              return IconButton(
                icon: Icon(icon),
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
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // SEARCH INPUT - EXACTLY LIKE THE IMAGE + FIXED
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: SearchBar(
                  controller: _searchController,
                  focusNode: _focusNode, // ← Auto cursor
                  leading: const Icon(Icons.search, size: 22),
                  hintText: 'Search for a country',
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
              backgroundColor:   theme.brightness == Brightness.light
      ? const MaterialStatePropertyAll(
                          Color(0xFFF0F2F5)) // 👈 soft grey in light mode
      :  MaterialStatePropertyAll(
                          theme.colorScheme.surface), 
                  trailing: [
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.filter_list),
                      tooltip: 'Sort by',
                      onSelected: (value) {
                        if (_sortBy != value) {
                          setState(() => _sortBy = value);
                          context.read<HomeCubit>().sort(value);
                        }
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
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _searchController,
                      builder: (context, value, child) {
                        if (value.text.isEmpty) return const SizedBox.shrink();
                        return IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            context.read<HomeCubit>().search('');
                            _focusNode.requestFocus(); // keep cursor
                          },
                        );
                      },
                    ),
                  ],
                  onChanged: _onSearchChanged,
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  ),
                ),
              ),
            ),

            // Main list
            SliverFillRemaining(
              hasScrollBody: true,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) return const ShimmerList();
                  if (state is HomeError) {
                    return ErrorRetry(
                      message: state.message,
                      onRetry: () => context.read<HomeCubit>().loadCountries(),
                    );
                  }

                  if (state is HomeSuccess) {
                    if (state.filtered.isEmpty) {
                      return const Center(child: Text('No countries found'));
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
