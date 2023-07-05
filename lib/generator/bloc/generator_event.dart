part of 'generator_bloc.dart';

@immutable
sealed class GeneratorEvent extends Equatable {
  const GeneratorEvent();
}

class LoadFavorites extends GeneratorEvent {
  @override
  List<Object> get props => [];
}

class GenerateWordpair extends GeneratorEvent {
  @override
  List<Object> get props => [];
}

class AddFavorite extends GeneratorEvent {
  final WordPair wordpair;

  const AddFavorite(this.wordpair);

  @override
  List<Object> get props => [wordpair];
}

class RemoveFavorite extends GeneratorEvent {
  final WordPair wordpair;

  const RemoveFavorite(this.wordpair);

  @override
  List<Object> get props => [wordpair];
}
