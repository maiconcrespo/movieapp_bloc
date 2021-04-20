import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/languages.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/constants/translations_constants.dart';

import 'package:movieapp/common/extensions/string_extensions.dart';
import 'package:movieapp/presentation/blocs/language_bloc/language_bloc_bloc.dart';
import 'package:movieapp/presentation/journeys/drawer/navigation_expanded_drawer.dart';
import 'package:movieapp/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movieapp/presentation/themes/app.color.dart';
import 'package:movieapp/presentation/widgets/app_dialog.dart';
import 'package:movieapp/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4)
      ]),
      width: Sizes.dimen_300,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Sizes.dimen_8,
                bottom: Sizes.dimen_18,
                left: Sizes.dimen_8,
                right: Sizes.dimen_8),
            child: Logo(
              height: Sizes.dimen_80,
            ),
          ),
          NavigationListItem(
            title: TranslationConstants.favoriteMovies.t(context),
            onPressed: () {},
          ),
          NavigationExpandedListItem(
            title: TranslationConstants.language.t(context),
            children: Languages.languages.map((e) => e.value).toList(),
            onPressed: (index) {
              BlocProvider.of<LanguageBlocBloc>(context)
                  .add(ToggleLanguageEvent(Languages.languages[index]));
            },
          ),
          NavigationListItem(
            title: TranslationConstants.feedback.t(context),
            onPressed: () {
              Navigator.of(context).pop();
              Wiredash.of(context)!.show();
            },
          ),
          NavigationListItem(
            title: TranslationConstants.about.t(context),
            onPressed: () {
              Navigator.of(context).pop();
              _showDialog(context);
            },
          ),
        ],
      )),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AppDialog(
          title: TranslationConstants.about,
          description: TranslationConstants.aboutDescripition,
          buttonText: TranslationConstants.okay,
          image: Image.asset(
            'assets/pngs/tmdb_logo.png',
            height: 30,
          ),
        );
      },
    );
  }
}
