import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:wordpair_generator/repository/repository.dart';

part 'generator_event.dart';
part 'generator_state.dart';

class GeneratorBloc extends Bloc<GeneratorEvent, GeneratorState> {
  GeneratorBloc({required FavoritesRepository favoritesRepository})
      : _favoritesRepository = favoritesRepository,
        super(GeneratorState(currentWordpair: WordPair.random())) {
    on<RequestFavorites>(_requestFavorites);
    on<GenerateWordpair>(_generateWordpair);
    on<ToggleLike>(_toggleFavorite);
  }

  final FavoritesRepository _favoritesRepository;

  Future<void> _requestFavorites(
      RequestFavorites event, Emitter<GeneratorState> emit) async {
    await emit.forEach<List<WordPair>>(_favoritesRepository.getFavorites(),
        onData: (favorites) => state.copyWith(
              favorites: favorites,
            ));
  }

  Future<void> _generateWordpair(
      GenerateWordpair event, Emitter<GeneratorState> emit) async {
    final prevWorpair = state.currentWordpair;
    emit(state.copyWith(
        currentWordpair: WordPair.random(),
        history: [prevWorpair, ...state.history]));
  }

  Future<void> _toggleFavorite(
      ToggleLike event, Emitter<GeneratorState> emit) async {
    // NOTE: THis shouldn't work like that, but it does
    emit(state.copyWith(favorites: [...state.favorites, event.wordpair]));
    await _favoritesRepository.toggleFavorite(event.wordpair);
  }
}
