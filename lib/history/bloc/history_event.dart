part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class LoadHistory extends HistoryEvent {
  @override
  List<Object> get props => [];
}

class ToggleFavorite extends HistoryEvent {
  final WordPair wordpair;

  const ToggleFavorite(this.wordpair);

  @override
  List<Object> get props => [wordpair];
}
