<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Flutter List UI

A beautiful and reusable Flutter UI components package with modern design patterns. This package provides customizable list-based UI components that are easy to integrate into your Flutter applications.

## Features

- Customizable list items with modern design
- Pre-built card layouts
- Header components
- Responsive design support
- Easy to integrate and customize

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_list_ui: ^1.0.0
```

## Usage

```dart
import 'package:flutter_list_ui/src/widgets/Info.dart';
import 'package:flutter_list_ui/src/widgets/InfoCard.dart';
import 'package:flutter_list_ui/src/widgets/InfoHeader.dart';
import 'package:flutter_list_ui/src/widgets/InfoList.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Info(
      card: InfoCard(
        header: InfoHeader(
          title: 'My List',
        ),
        body: InfoList(
          items: [
            {'title': 'Item 1', 'subtitle': 'Description 1'},
            {'title': 'Item 2', 'subtitle': 'Description 2'},
          ],
        ),
      ),
    );
  }
}
```

## Additional information

For more examples, please refer to the example directory in the package repository.

## Contributing

Contributions are welcome! If you find a bug or want a feature, please feel free to:

1. Open an issue
2. Create a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
# flutter_list_ui
