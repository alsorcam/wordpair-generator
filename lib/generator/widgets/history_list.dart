import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HistoryListView extends StatelessWidget {
  HistoryListView(
      {Key? key,
      required this.favorites,
      required this.history,
      required this.wordClick})
      : super(key: key);

  /// Needed so that [WordpairGeneratorAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();

  // Fields that will be managed from the parent component
  final List<WordPair> favorites;
  final List<WordPair> history;
  final Function wordClick;

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
    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: false,
        initialItemCount: history.length,
        itemBuilder: (context, index, animation) {
          final pair = history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  wordClick(pair);
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
  }
}
