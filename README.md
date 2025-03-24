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

![Example Image](https://github.com/user-attachments/assets/06aae649-3f2b-4d51-849b-6c480e69d2e1)

## Features

- Modern Material 3 design system integration
- Flexible generic type support for list items
- Extensive styling and customization options
- Responsive layouts with proper constraints
- Riverpod integration for state management
- Zero dependencies on other UI packages
- Flat design with customizable borders and colors

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_list_ui: ^1.0.4
```

## Usage

### Basic Usage

```dart
import 'package:flutter_list_ui/flutter_list_ui.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Info(
      card: InfoCard(
        header: InfoHeader(
          title: 'My List',
          subtitle: 'A beautiful list example',
        ),
        body: InfoList(
          items: const [
            InfoItem(
              title: 'Item 1',
              subtitle: 'Description 1',
              icon: Icons.star,
              onTap: null,
            ),
            InfoItem(
              title: 'Item 2',
              subtitle: 'Description 2',
              icon: Icons.favorite,
              onTap: null,
            ),
          ],
          backgroundColor: Colors.white,
          buildItem: (item) => _buildItem(item),
        ),
      ),
    );
  }

  Widget _buildItem(InfoItem item) {
    return Builder(
      builder: (context) => ListTile(
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          item.subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Icon(item.icon),
        trailing: Icon(item.trailingIcon),
        onTap: item.onTap,
      ),
    );
  }
}
```

### Using Custom Models

```dart
import 'package:flutter_list_ui/flutter_list_ui.dart';

class CustomItem {
  const CustomItem({
    required this.name,
    required this.description,
    this.isActive = false,
  });

  final String name;
  final String description;
  final bool isActive;
}

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Info(
      card: InfoCard(
        header: InfoHeader(
          title: 'Custom List',
          subtitle: 'Using custom model',
        ),
        body: InfoList<CustomItem>(
          items: const [
            CustomItem(
              name: 'Custom Item 1',
              description: 'Description 1',
              isActive: true,
            ),
            CustomItem(
              name: 'Custom Item 2',
              description: 'Description 2',
              isActive: false,
            ),
          ],
          backgroundColor: Colors.white,
          buildItem: (item) => _buildItem(item),
        ),
      ),
    );
  }

  Widget _buildItem(CustomItem item) {
    return Builder(
      builder: (context) => ListTile(
        title: Text(
          item.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: item.isActive ? Colors.blue : null,
          ),

        ),
        subtitle: Text(
          item.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Icon(
          item.isActive ? Icons.check_circle : Icons.circle_outlined,
          color: item.isActive ? Colors.blue : null,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
```

### Using with Riverpod

```dart
import 'package:flutter_list_ui/flutter_list_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoWithRiverpod extends InfoWithRiverpod {
  MyInfoWithRiverpod({super.key}) : super(
    card: MyInfoCard(),
    paddingOption: 'all',
    paddingVertical: 16.0,
    paddingHorizontal: 16.0,
  );
}
```

## API Reference

### Info Widget
```dart
class Info extends StatelessWidget {
  final InfoCard card;
  final String paddingOption;
  final double paddingVertical;
  final double paddingHorizontal;
}
```

### InfoCard Widget
```dart
class InfoCard extends StatelessWidget {
  final InfoHeader header;
  final Widget body;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool isRound;
}
```

### InfoHeader Widget
```dart
class InfoHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
}
```

### InfoList Widget
```dart
class InfoList<T> extends StatelessWidget {
  final List<T> items;
  final Color? backgroundColor;
  final Widget Function(T item) buildItem;
  final EdgeInsetsGeometry? contentPadding;
  final bool shrinkWrap;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final ScrollPhysics? physics;
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
