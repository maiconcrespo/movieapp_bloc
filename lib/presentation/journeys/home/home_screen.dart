import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movieapp/presentation/journeys/drawer/navigation_drawer.dart';

import 'movie_carousel/movie_carousel_widget.dart';
import 'movie_tabbed/movie_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = getItInstance<MovieBackdropBloc>();
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => movieCarouselBloc),
          BlocProvider(create: (context) => movieBackdropBloc),
          BlocProvider(create: (context) => movieTabbedBloc)
        ],
        child: Scaffold(
            drawer: const NavigationDrawer(),
            body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
              bloc: movieCarouselBloc,
              builder: (context, state) {
                if (state is MovieCarouselLoaded) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.4,
                        child: MovieCarouselWidget(
                          movies: state.movies,
                          defaultIndex: state.defaultIndex,
                        ),
                      ),
                      FractionallySizedBox(
                        heightFactor: 0.6,
                        alignment: Alignment.bottomCenter,
                        child: MovieTabbedWidget(),
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            )));
  }
}
