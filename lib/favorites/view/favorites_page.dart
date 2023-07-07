import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:wordpair_generator/favorites/favorites.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
      var favorites = state.favorites;

      final theme = Theme.of(context);
      final headlineStyle = theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

      final headline = Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          AppLocalizations.of(context)!.favorites,
          style: headlineStyle,
        ),
      );

      if (favorites.isEmpty) {
        return Center(
          child: Column(
            children: [
              headline,
              Text(AppLocalizations.of(context)!.favorites_empty),
            ],
          ),
        );
      }

      return ListView(
        children: [
          Center(child: headline),
          for (var pair in favorites)
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
            ),
        ],
      );
    });
  }
}
