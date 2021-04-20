part of 'language_bloc_bloc.dart';

abstract class LanguageBlocEvent extends Equatable {
  const LanguageBlocEvent();

  @override
  List<Object> get props => [];
}

class ToggleLanguageEvent extends LanguageBlocEvent {
  final LanguagesEntity language;

  const ToggleLanguageEvent(this.language);
  @override
  List<Object> get props => [language.code];
}
