part of 'home_cubit.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
class HomeSuccess extends HomeState {
  final List<CountrySummary> countries;
  final List<CountrySummary> filtered;
  final String sortBy;
  final String? selectedContinent; // ← new: null = all

  HomeSuccess({
    required this.countries,
    required this.filtered,
    required this.sortBy,
    this.selectedContinent,
  });

  HomeSuccess copyWith({
    List<CountrySummary>? filtered,
    String? sortBy,
    String? selectedContinent,
  }) {
    return HomeSuccess(
      countries: countries,
      filtered: filtered ?? this.filtered,
      sortBy: sortBy ?? this.sortBy,
      selectedContinent: selectedContinent ?? this.selectedContinent,
    );
  }
}
