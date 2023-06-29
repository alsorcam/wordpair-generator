import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'generator_event.dart';
part 'generator_state.dart';

class GeneratorBloc extends Bloc<GeneratorEvent, GeneratorState> {
  GeneratorBloc() : super(GeneratorState(currentWordpair: WordPair.random())) {
    on<GenerateWordpair>(_generateWordpair);
    on<AddFavorite>(_addFavorite);
    on<RemoveFavorite>(_removeFavorite);
  }

  void _generateWordpair(GenerateWordpair event, Emitter<GeneratorState> emit) {
    final prevWorpair = state.currentWordpair;
    emit(state.copyWith(
        currentWordpair: WordPair.random(),
        history: [...state.history, prevWorpair]));
  }

  void _addFavorite(AddFavorite event, Emitter<GeneratorState> emit) {
    emit(state.copyWith(favorites: [...state.favorites, event.wordpair]));
  }

  void _removeFavorite(RemoveFavorite event, Emitter<GeneratorState> emit) {
    emit(state
        .copyWith(favorites: [...state.favorites..remove(event.wordpair)]));
  }
}
