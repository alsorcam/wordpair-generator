// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/card_theme.dart';
import 'package:flutter/src/material/color_scheme.dart';
import 'package:flutter/src/material/material.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/src/widgets/scroll_delegate.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:flutter/src/widgets/sliver.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:wordpair_generator/generator/widgets/history_list.widgetbook.dart';
import 'package:wordpair_generator/generator/widgets/wordpair_card.widgetbook.dart';

final directories = [
  WidgetbookFolder(
    name: 'widgets',
    children: [
      WidgetbookComponent(
        name: 'AnimatedList',
        useCases: [
          WidgetbookUseCase(
            name: 'History list',
            builder: (context) => historyListViewUseCase(context),
          ),
        ],
      ),
    ],
  ),
  WidgetbookFolder(
    name: 'material',
    children: [
      WidgetbookComponent(
        name: 'Card',
        useCases: [
          WidgetbookUseCase(
            name: 'Big card',
            builder: (context) => wordPairCardUseCase(context),
          ),
        ],
      ),
    ],
  ),
];
