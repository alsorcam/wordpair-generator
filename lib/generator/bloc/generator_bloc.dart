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
    on<LoadFavorites>(_loadFavorites);
    on<GenerateWordpair>(_generateWordpair);
    on<AddFavorite>(_addFavorite);
    on<RemoveFavorite>(_removeFavorite);
  }
  final FavoritesRepository _favoritesRepository;

  Future<void> _loadFavorites(
      LoadFavorites event, Emitter<GeneratorState> emit) async {
    await emit.forEach<List<WordPair>>(_favoritesRepository.getFavorites(),
        onData: (favorites) => state.copyWith(
              favorites: favorites,
            ));
  }

  void _generateWordpair(GenerateWordpair event, Emitter<GeneratorState> emit) {
    final prevWorpair = state.currentWordpair;
    emit(state.copyWith(
        currentWordpair: WordPair.random(),
        history: [...state.history, prevWorpair]));
  }

  Future<void> _addFavorite(
      AddFavorite event, Emitter<GeneratorState> emit) async {
    // emit(state.copyWith(favorites: [...state.favorites, event.wordpair]));
    await _favoritesRepository.addFavorite(event.wordpair);
  }

  Future<void> _removeFavorite(
      RemoveFavorite event, Emitter<GeneratorState> emit) async {
    // emit(state
    //     .copyWith(favorites: [...state.favorites..remove(event.wordpair)]));
    await _favoritesRepository.removeFavorite(event.wordpair);
  }
}
