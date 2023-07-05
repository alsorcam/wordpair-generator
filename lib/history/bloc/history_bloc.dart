import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'package:wordpair_generator/repository/repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(
      {required FavoritesRepository favoritesRepository,
      required HistoryRepository historyRepository})
      : _favoritesRepository = favoritesRepository,
        _historyRepository = historyRepository,
        super(HistoryState()) {
    on<LoadHistory>(_loadHistory);
    on<ToggleFavorite>(_toggleFavorite);
  }

  final FavoritesRepository _favoritesRepository;
  final HistoryRepository _historyRepository;

  Future<void> _loadHistory(
      LoadHistory event, Emitter<HistoryState> emit) async {
    await emit.forEach<List<WordPair>>(_historyRepository.getHistory(),
        onData: (history) => state.copyWith(
              history: history,
            ));
    await emit.forEach<List<WordPair>>(_favoritesRepository.getFavorites(),
        onData: (favorites) => state.copyWith(
              favorites: favorites,
            ));
  }

  Future<void> _toggleFavorite(
      ToggleFavorite event, Emitter<HistoryState> emit) async {
    await _favoritesRepository.toggleFavorite(event.wordpair);
  }
}
