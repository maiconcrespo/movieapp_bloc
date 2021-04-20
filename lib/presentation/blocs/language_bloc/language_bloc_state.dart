part of 'language_bloc_bloc.dart';

abstract class LanguageBlocState extends Equatable {
  const LanguageBlocState();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageBlocState {
  final Locale locale;

  LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale.languageCode];
}
