import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

// Import the generated directories variable
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [],
      appBuilder: (context, child) => child,
    );
  }
}
