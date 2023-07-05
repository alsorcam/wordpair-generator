part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class FavoritesLoaded extends FavoritesEvent {
  const FavoritesLoaded();
}
