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

  HomeSuccess({
    required this.countries,
    required this.filtered,
    required this.sortBy,
  });

  HomeSuccess copyWith({
    List<CountrySummary>? filtered,
    String? sortBy,
  }) {
    return HomeSuccess(
      countries: countries,
      filtered: filtered ?? this.filtered,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}
