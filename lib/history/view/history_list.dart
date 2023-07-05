import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wordpair_generator/history/history.dart';
import 'package:wordpair_generator/repository/repository.dart';

class HistoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
          favoritesRepository: context.read<FavoritesRepository>(),
          historyRepository: context.read<HistoryRepository>())
        ..add(LoadHistory()),
      child: _HistoryListView(),
    );
  }
}

class _HistoryListView extends StatelessWidget {
  _HistoryListView({Key? key}) : super(key: key);

  /// Needed so that [WordpairGeneratorAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();

  /// Used to "fade out" the history items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.center,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
      // appState.historyListKey = _key;
      var history = state.history;
      var favorites = state.favorites;

      return ShaderMask(
        shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
        // This blend mode takes the opacity of the shader (i.e. our gradient)
        // and applies it to the destination (i.e. our animated list).
        blendMode: BlendMode.dstIn,
        child: AnimatedList(
          key: _key,
          reverse: false,
          // padding: EdgeInsets.only(top: 100),
          initialItemCount: history.length,
          itemBuilder: (context, index, animation) {
            final pair = history[index];
            return SizeTransition(
              sizeFactor: animation,
              child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    context.read<HistoryBloc>().add(ToggleFavorite(pair));
                  },
                  icon: favorites.contains(pair)
                      ? Icon(Icons.favorite, size: 12)
                      : SizedBox(),
                  label: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
