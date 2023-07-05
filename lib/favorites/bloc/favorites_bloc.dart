import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:wordpair_generator/repository/repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({required FavoritesRepository favoritesRepository})
      : _favoritesRepository = favoritesRepository,
        super(FavoritesState()) {
    on<FavoritesLoaded>(_loadFavorites);
  }

  final FavoritesRepository _favoritesRepository;

  Future<void> _loadFavorites(
      FavoritesLoaded event, Emitter<FavoritesState> emit) async {
    await emit.forEach<List<WordPair>>(_favoritesRepository.getFavorites(),
        onData: (favorites) => FavoritesState(
              favorites: favorites,
            ));
  }
}
