part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int? currentTabIndex;
  const MovieTabbedState({this.currentTabIndex});

  @override
  List<Object?> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({int? currentTabIndex, required this.movies})
      : super(currentTabIndex: currentTabIndex);
  @override
  List<Object?> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final AppErrorType errorType;

  const MovieTabLoadError({required this.errorType, int? currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
