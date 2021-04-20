import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/common/constants/languages.dart';
import 'package:movieapp/domain/entities/languages_entity.dart';

part 'language_bloc_event.dart';
part 'language_bloc_state.dart';

class LanguageBlocBloc extends Bloc<LanguageBlocEvent, LanguageBlocState> {
  LanguageBlocBloc()
      : super(LanguageLoaded(
          Locale(
            Languages.languages[0].code,
          ),
        ));

  @override
  Stream<LanguageBlocState> mapEventToState(
    LanguageBlocEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}
