part of 'generator_bloc.dart';

@immutable
sealed class GeneratorEvent extends Equatable {
  const GeneratorEvent();
}

class RequestFavorites extends GeneratorEvent {
  @override
  List<Object> get props => [];
}

class GenerateWordpair extends GeneratorEvent {
  @override
  List<Object> get props => [];
}

class ToggleLike extends GeneratorEvent {
  final WordPair wordpair;

  const ToggleLike(this.wordpair);

  @override
  List<Object> get props => [wordpair];
}
