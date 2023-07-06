import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:wordpair_generator/repository/repository.dart';

part 'generator_event.dart';
part 'generator_state.dart';

class GeneratorBloc extends Bloc<GeneratorEvent, GeneratorState> {
  GeneratorBloc(
      {required HistoryRepository historyRepository,
      required FavoritesRepository favoritesRepository})
      : _historyRepository = historyRepository,
        _favoritesRepository = favoritesRepository,
        // FIXME: Don't generate a random word if there's already a state
        super(GeneratorState(currentWordpair: WordPair.random())) {
    on<InitGenerator>(_initGenerator);
    on<GenerateWordpair>(_generateWordpair);
    on<ToggleLike>(_toggleFavorite);
  }

  final HistoryRepository _historyRepository;
  final FavoritesRepository _favoritesRepository;

  Future<void> _initGenerator(
      InitGenerator event, Emitter<GeneratorState> emit) async {
    // FIXME: Only works for one of them
    await emit.forEach<List<WordPair>>(_historyRepository.getHistory(),
        onData: (history) => state.copyWith(
              history: history,
            ));
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
    await _historyRepository.addToHistory(prevWorpair);
  }

  Future<void> _toggleFavorite(
      ToggleLike event, Emitter<GeneratorState> emit) async {
    // NOTE: THis shouldn't work like that, but it does
    emit(state.copyWith(favorites: [...state.favorites, event.wordpair]));
    await _favoritesRepository.toggleFavorite(event.wordpair);
  }
}
