import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousel/movie_card_wiget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final PageController pageController;
  final String? posterPath;
  final int? movieId;
  const AnimatedMovieCardWidget({
    Key? key,
    required this.index,
    required this.pageController,
    required this.posterPath,
    required this.movieId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.center,
            child: Container(
              height: Curves.easeIn.transform(value) *
                  MediaQuery.of(context).size.height *
                  0.35,
              width: Sizes.dimen_230,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.center,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.7) *
                      MediaQuery.of(context).size.height *
                      0.35,
              width: Sizes.dimen_230,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
