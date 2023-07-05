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
    on<LoadFavorites>(_loadFavorites);
    on<GenerateWordpair>(_generateWordpair);
    on<ToggleLike>(_toggleFavorite);
  }

  final HistoryRepository _historyRepository;
  final FavoritesRepository _favoritesRepository;

  Future<void> _loadFavorites(
      LoadFavorites event, Emitter<GeneratorState> emit) async {
    await emit.forEach<List<WordPair>>(_favoritesRepository.getFavorites(),
        onData: (favorites) => state.copyWith(
              favorites: favorites,
            ));
  }

  Future<void> _generateWordpair(
      GenerateWordpair event, Emitter<GeneratorState> emit) async {
    final prevWorpair = state.currentWordpair;
    emit(state.copyWith(currentWordpair: WordPair.random()));
    await _historyRepository.addToHistory(prevWorpair);
  }

  Future<void> _toggleFavorite(
      ToggleLike event, Emitter<GeneratorState> emit) async {
    await _favoritesRepository.toggleFavorite(event.wordpair);
  }
}
