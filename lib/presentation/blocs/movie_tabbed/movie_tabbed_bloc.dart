import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usescases/get_coming_soon.dart';
import 'package:movieapp/domain/usescases/get_playing_now.dart';
import 'package:movieapp/domain/usescases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetCommingSoon getCommingSoon;
  final GetPlayingNow getPlayingNow;

  MovieTabbedBloc(
      {required this.getPopular,
      required this.getCommingSoon,
      required this.getPlayingNow})
      : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChange) {
      late Either<AppError, List<MovieEntity>> moviesEither;

      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          print(moviesEither);
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          print(moviesEither);
          break;
        case 2:
          moviesEither = await getCommingSoon(NoParams());
          print(moviesEither);
          break;
      }

      // yield MovieTabLoadError(
      //   currentTabIndex: event.currentTabIndex,
      //   errorType: AppErrorType.api,
      // );

      yield moviesEither.fold(
          (l) => MovieTabLoadError(
                errorType: l.appErrorType,
                currentTabIndex: event.currentTabIndex,
              ), (movies) {
        return MovieTabChanged(
            currentTabIndex: event.currentTabIndex, movies: movies);
      });
    }
  }
}
