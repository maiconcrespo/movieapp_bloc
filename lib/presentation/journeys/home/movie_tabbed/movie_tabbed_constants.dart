import 'package:movieapp/common/constants/translations_constants.dart';

import 'tab.dart';

class MovieTabbedConstants {
  static List<Tab> moviesTabs = [
    Tab(index: 0, title: TranslationConstants.popular),
    Tab(index: 1, title: TranslationConstants.now),
    Tab(index: 2, title: TranslationConstants.soon),
  ];
}
