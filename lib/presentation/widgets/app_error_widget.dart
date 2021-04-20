import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/translations_constants.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/common/extensions/String_extensions.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;
  // final MovieCarouselBloc bloc;
  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                text: TranslationConstants.retry,
                onPressed: () => onPressed,
              ),
              Button(
                  text: TranslationConstants.feedback,
                  onPressed: () => Wiredash.of(context)!.show())
            ],
          )
        ],
      ),
    );
  }
}
