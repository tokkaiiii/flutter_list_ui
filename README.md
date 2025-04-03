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

<!--
To update this image:
1. Create a new issue in this repository
2. Drag and drop the example.png file into the issue
3. Copy the generated image URL and replace it here
-->
![Image](https://github.com/user-attachments/assets/621b58e0-a569-4898-a8c4-6bb716bc3a28)

## Features

- `InfoList`: A flexible list widget that supports:
  - Generic type support for any data model
  - Empty state handling with customizable UI
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
  flutter_list_ui: ^1.3.0
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
  buildEmptyItem: (context, items) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.inbox_outlined,
          size: 48,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 16),
        Text(
          '데이터가 없습니다',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
        ),
      ],
    ),
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
  buildEmptyItem: (context, items) => Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off,
          size: 48,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 16),
        Text(
          '검색 결과가 없습니다',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '다른 검색어를 시도해보세요',
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
          ),
        ),
      ],
    ),
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

### Info Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| card | InfoCard | The InfoCard widget to display |
| paddingOption | String | Padding option ('all' or 'symmetric', default: 'all') |
| paddingVertical | double | Vertical padding value (default: 8.0) |
| paddingHorizontal | double | Horizontal padding value (default: 8.0) |

### InfoCard Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| header | InfoHeaderBase | Header widget |
| body | InfoList<T> | Main content widget |
| isRound | bool | Whether to show rounded corners (default: false) |
| backgroundColor | Color? | Background color |
| margin | EdgeInsetsGeometry? | Margin around the card |
| padding | EdgeInsetsGeometry? | Padding around the content |
| showBorder | bool | Whether to show border (default: true) |
| borderColor | Color? | Border color |
| useSliver | bool | Whether to use SliverList (default: false) |

### InfoHeader Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| title | String | Title text |
| subtitle | String? | Optional subtitle text |
| trailing | Widget? | Optional trailing widget |
| titleStyle | TextStyle? | Style for the title text |
| subtitleStyle | TextStyle? | Style for the subtitle text |
| backgroundColor | Color? | Background color |
| padding | EdgeInsetsGeometry? | Padding around the content |

### InfoList Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| items | List<T> | List of items to display |
| buildItem | Widget Function(T) | Function to build each item |
| backgroundColor | Color? | Background color |
| contentPadding | EdgeInsetsGeometry? | Padding around the list content |
| shrinkWrap | bool | Whether the list should shrink-wrap its content (default: true) |
| separatorBuilder | Widget Function(BuildContext, int)? | Function to build separator widgets |
| physics | ScrollPhysics? | Scroll physics for the list |
| itemPadding | EdgeInsetsGeometry? | Padding for each item |
| itemDecoration | BoxDecoration? | Decoration for each item container |
| removeTopPadding | bool | Whether to remove top padding (default: false) |
| emptyWidget | Widget? | Widget to show when items is empty |
| isLoading | bool | Whether to show skeleton loading UI (default: false) |
| skeletonCount | int | Number of skeleton items to show (default: 3) |
| skeletonBuilder | Widget Function(BuildContext, int)? | Function to build skeleton items |
| buildEmptyItem | Widget Function(BuildContext, List<T>)? | Function to build empty state UI |
| useSliver | bool | Whether to use SliverList (default: false) |

### InfoCardWithRiverpod Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| header | InfoHeaderBase | Header widget |
| body | InfoList<T> | Main content widget |
| isRound | bool | Whether to show rounded corners (default: false) |
| backgroundColor | Color? | Background color |
| margin | EdgeInsetsGeometry? | Margin around the card |
| padding | EdgeInsetsGeometry? | Padding around the content |
| builder | Widget Function(BuildContext, WidgetRef)? | Custom builder function |
| showBorder | bool | Whether to show border (default: true) |
| borderColor | Color? | Border color |
| useSliver | bool | Whether to use SliverList (default: false) |

### InfoListWithRiverpod Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| items | List<T> | List of items to display |
| buildItem | Widget Function(T) | Function to build each item |
| backgroundColor | Color? | Background color |
| contentPadding | EdgeInsetsGeometry? | Padding around the list content |
| shrinkWrap | bool | Whether the list should shrink-wrap its content (default: true) |
| separatorBuilder | Widget Function(BuildContext, int)? | Function to build separator widgets |
| physics | ScrollPhysics? | Scroll physics for the list |
| itemPadding | EdgeInsetsGeometry? | Padding for each item |
| itemDecoration | BoxDecoration? | Decoration for each item container |
| removeTopPadding | bool | Whether to remove top padding (default: false) |
| emptyWidget | Widget? | Widget to show when items is empty |
| isLoading | bool | Whether to show skeleton loading UI (default: false) |
| skeletonCount | int | Number of skeleton items to show (default: 3) |
| skeletonBuilder | Widget Function(BuildContext, int)? | Function to build skeleton items |
| buildEmptyItem | Widget Function(BuildContext, List<T>)? | Function to build empty state UI |
| useSliver | bool | Whether to use SliverList (default: false) |

### CustomInfoList Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| items | List<T> | List of items to display |
| buildItem | Widget Function(T) | Function to build each item |
| backgroundColor | Color? | Background color |
| contentPadding | EdgeInsetsGeometry? | Padding around the list content |
| shrinkWrap | bool | Whether the list should shrink-wrap its content (default: true) |
| separatorBuilder | Widget Function(BuildContext, int)? | Function to build separator widgets |
| physics | ScrollPhysics? | Scroll physics for the list |
| itemPadding | EdgeInsetsGeometry? | Padding for each item |
| itemDecoration | BoxDecoration? | Decoration for each item container |
| removeTopPadding | bool | Whether to remove top padding (default: false) |
| emptyWidget | Widget? | Widget to show when items is empty |
| isLoading | bool | Whether to show skeleton loading UI (default: false) |
| skeletonCount | int | Number of skeleton items to show (default: 3) |
| skeletonBuilder | Widget Function(BuildContext, int)? | Function to build skeleton items |
| buildEmptyItem | Widget Function(BuildContext, List<T>)? | Function to build empty state UI |
| useSliver | bool | Whether to use SliverList (default: false) |

### CustomInfoListWithRiverpod Widget Properties

| Property | Type | Description |
|----------|------|-------------|
| items | List<T> | List of items to display |
| buildItem | Widget Function(T) | Function to build each item |
| backgroundColor | Color? | Background color |
| contentPadding | EdgeInsetsGeometry? | Padding around the list content |
| shrinkWrap | bool | Whether the list should shrink-wrap its content (default: true) |
| separatorBuilder | Widget Function(BuildContext, int)? | Function to build separator widgets |
| physics | ScrollPhysics? | Scroll physics for the list |
| itemPadding | EdgeInsetsGeometry? | Padding for each item |
| itemDecoration | BoxDecoration? | Decoration for each item container |
| removeTopPadding | bool | Whether to remove top padding (default: false) |
| emptyWidget | Widget? | Widget to show when items is empty |
| isLoading | bool | Whether to show skeleton loading UI (default: false) |
| skeletonCount | int | Number of skeleton items to show (default: 3) |
| skeletonBuilder | Widget Function(BuildContext, int)? | Function to build skeleton items |
| buildEmptyItem | Widget Function(BuildContext, List<T>)? | Function to build empty state UI |
| useSliver | bool | Whether to use SliverList (default: false) |

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
