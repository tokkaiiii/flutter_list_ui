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

A Flutter package that provides a collection of list-related widgets with consistent styling and behavior.

## Features

- `InfoList`: A flexible list widget that supports:
  - Generic type support for any data model
  - Empty state handling
  - Skeleton loading UI with shimmer effect
  - AsyncValue integration with Riverpod
  - Custom item builders
  - Custom separators
  - Custom styling options
- `InfoCard`: A card widget that wraps content with consistent styling
- `InfoHeader`: A header widget for cards with title and optional actions
- `InfoItemBase`: A base model for list items with common properties

## Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_list_ui: ^1.0.0
  shimmer: ^3.0.0  # Optional: for skeleton loading effect
```

## Usage

### Basic List

```dart
InfoList.info(
  items: items,
  buildItem: (item) => ListTile(
    title: Text(item.title),
    subtitle: Text(item.subtitle),
  ),
);
```

### With Empty State

```dart
InfoList.info(
  items: items,
  emptyWidget: const Center(
    child: Text('No items found'),
  ),
  buildItem: (item) => ListTile(
    title: Text(item.title),
    subtitle: Text(item.subtitle),
  ),
);
```

### With Skeleton Loading

```dart
InfoList.info(
  items: items,
  isLoading: true,
  skeletonCount: 3,
  skeletonBuilder: (context, index) => Container(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 150,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
```

### With Riverpod AsyncValue

```dart
InfoList.when(
  value: itemsAsyncValue,
  buildItem: (item) => ListTile(
    title: Text(item.title),
    subtitle: Text(item.subtitle),
  ),
  emptyWidget: const Center(
    child: Text('No items found'),
  ),
);
```

### With Shimmer Effect

```dart
import 'package:shimmer/shimmer.dart';

InfoList.info(
  items: items,
  isLoading: true,
  skeletonBuilder: (context, index) => Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 150,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
```

### With InfoCard

```dart
Info(
  card: InfoCard(
    header: InfoHeader(
      title: 'List Title',
      titleStyle: Theme.of(context).textTheme.titleLarge,
    ),
    body: InfoList.info(
      items: items,
      buildItem: (item) => ListTile(
        title: Text(item.title),
        subtitle: Text(item.subtitle),
      ),
    ),
    backgroundColor: Colors.white,
    isRound: true,
    showBorder: false,
  ),
);
```

## Additional Information

### InfoList Properties

| Property | Type | Description |
|----------|------|-------------|
| items | List<T> | The list of items to display |
| buildItem | Widget Function(T) | Function to build each item widget |
| backgroundColor | Color? | Background color of the list |
| contentPadding | EdgeInsetsGeometry? | Padding around the list content |
| shrinkWrap | bool | Whether the list should shrink-wrap its content |
| separatorBuilder | Widget Function(BuildContext, int)? | Function to build separator widgets |
| physics | ScrollPhysics? | Scroll physics for the list |
| itemPadding | EdgeInsetsGeometry? | Padding for each item |
| itemDecoration | BoxDecoration? | Decoration for each item container |
| removeTopPadding | bool | Whether to remove top padding |
| emptyWidget | Widget? | Widget to show when items is empty |
| isLoading | bool | Whether to show skeleton loading UI |
| skeletonCount | int | Number of skeleton items to show |
| skeletonBuilder | Widget Function(BuildContext, int)? | Function to build skeleton items |

### InfoCard Properties

| Property | Type | Description |
|----------|------|-------------|
| header | InfoHeader? | Header widget for the card |
| body | Widget | Main content of the card |
| backgroundColor | Color? | Background color of the card |
| isRound | bool | Whether to show rounded corners |
| showBorder | bool | Whether to show border |
| padding | EdgeInsetsGeometry? | Padding around the card content |
| margin | EdgeInsetsGeometry? | Margin around the card |

### InfoHeader Properties

| Property | Type | Description |
|----------|------|-------------|
| title | String | Title text |
| titleStyle | TextStyle? | Style for the title text |
| actions | List<Widget>? | Action widgets to show in the header |

## Dependencies

- flutter_riverpod: ^2.5.1 (Required for AsyncValue support)
- flutter_screenutil: ^5.9.0
- google_fonts: ^6.1.0
- cached_network_image: ^3.3.1
- shimmer: ^3.0.0 (Optional: for skeleton loading effect)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## About

A reusable Flutter UI components package
