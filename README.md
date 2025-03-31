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

# info_ui_package

A Flutter package that provides a set of UI components for displaying information in a consistent and beautiful way.

## Features

- `InfoList`: A flexible list widget that can display any type of data with consistent styling
- `InfoCard`: A card widget that wraps content with a header and body
- `InfoHeader`: A header widget for InfoCard with customizable title and style
- Support for AsyncValue data handling
- Customizable styling and layout options

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  info_ui_package: ^1.0.0
```

## Usage

### Basic InfoList Usage

```dart
InfoList(
  items: yourItems,
  buildItem: (item) => YourCustomItemWidget(item: item),
)
```

### InfoList with AsyncValue

```dart
InfoList.when(
  value: yourAsyncData,
  buildItem: (item) => YourCustomItemWidget(item: item),
  shrinkWrap: false,
  physics: const BouncingScrollPhysics(),
  backgroundColor: Colors.white,
  contentPadding: EdgeInsets.zero,
  itemDecoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Colors.grey,
      ),
    ),
  ),
)
```

![InfoList Example](https://github.com/user-attachments/assets/3d90b563-8e08-4da4-ae5d-f9a6d8eabe84)

### InfoCard Usage

```dart
Info(
  card: InfoCard(
    header: InfoHeader(
      title: 'Your Title',
      titleStyle: Theme.of(context).textTheme.titleLarge,
      backgroundColor: Colors.white,
    ),
    body: YourContent(),
  ),
)
```

## Additional Information

### InfoList Parameters

- `items`: List of items to display
- `buildItem`: Function to build each item widget
- `backgroundColor`: Background color of the list
- `contentPadding`: Padding around the list content
- `shrinkWrap`: Whether the list should shrink-wrap its content
- `separatorBuilder`: Custom separator builder between items
- `physics`: Scroll physics for the list
- `itemPadding`: Padding for each item
- `itemDecoration`: Decoration for each item container
- `removeTopPadding`: Whether to remove top padding

### InfoCard Parameters

- `header`: InfoHeader widget for the card title
- `body`: Content to display in the card body

### InfoHeader Parameters

- `title`: Text to display in the header
- `titleStyle`: Text style for the title
- `backgroundColor`: Background color of the header

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
