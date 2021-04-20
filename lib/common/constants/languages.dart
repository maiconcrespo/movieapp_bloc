import 'package:movieapp/domain/entities/languages_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguagesEntity(code: 'en', value: 'English'),
    LanguagesEntity(code: 'es', value: 'Spanish'),
  ];
}
