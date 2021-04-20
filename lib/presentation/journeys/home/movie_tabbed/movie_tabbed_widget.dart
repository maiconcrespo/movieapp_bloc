import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/translations_constants.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movieapp/presentation/widgets/app_error_widget.dart';
import 'package:movieapp/common/extensions/String_extensions.dart';
import 'movie_list_view_builder.dart';
import 'movie_tabbed_constants.dart';

import 'tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChange(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.moviesTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.moviesTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.moviesTabs[i].index ==
                          state.currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                state.movies.isEmpty
                    ? Expanded(
                        child: Center(
                        child: Text(
                          TranslationConstants.noMovies.t(context),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ))
                    : Expanded(
                        child: MovieListViewBuilder(movies: state.movies),
                      ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                      errorType: state.errorType,
                      onPressed: () => movieTabbedBloc.add(MovieTabChange(
                            currentTabIndex: state.currentTabIndex!,
                          ))),
                )
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChange(currentTabIndex: index));
  }
}
