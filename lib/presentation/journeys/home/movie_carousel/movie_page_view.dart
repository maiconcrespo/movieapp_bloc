import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousel/movie_card_wiget.dart';

import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity>? movies;
  final int initialPage;

  const MoviePageView(
      {Key? key, required this.movies, required this.initialPage})
      : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);
  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10),
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            final MovieEntity movie = widget.movies![index];

            return AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController,
              posterPath: movie.posterPath,
              movieId: movie.id,
            );
          },
          pageSnapping: true,
          itemCount: widget.movies!.length,
          onPageChanged: (index) {
            BlocProvider.of<MovieBackdropBloc>(context)
                .add(MovieBackDropChangedEvent(widget.movies![index]));
          },
        ),
      ),
    );
  }
}
