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

A collection of beautiful and reusable Flutter UI components with modern design patterns.

## Features

* Flexible info card system with customizable headers and lists
* Built-in Riverpod integration
* Modern design with Material You support
* Highly customizable components

## Getting started

Add the package to your pubspec.yaml:

```yaml
dependencies:
  flutter_list_ui: ^1.1.4
  flutter_riverpod: ^2.5.1  # Required for InfoCardWithRiverpod
```

Or run the following command:
```bash
flutter pub add flutter_list_ui
flutter pub add flutter_riverpod  # Required for InfoCardWithRiverpod
```

## Usage

### Basic Usage

```dart
Info(
  card: InfoCard(
    header: InfoHeader(
      title: 'My Header',
      subtitle: 'Optional subtitle',
      backgroundColor: Colors.white,
    ),
    body: InfoList<String>(
      items: ['Item 1', 'Item 2', 'Item 3'],
      buildItem: (item) => ListTile(title: Text(item)),
    ),
    backgroundColor: Colors.white,
    isRound: true,
    showBorder: true,
  ),
)
```

### Riverpod Integration

First, wrap your app with `ProviderScope`:

```dart
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
```

Then use `InfoCardWithRiverpod`:

```dart
InfoWithRiverpod(
  card: InfoCardWithRiverpod(
    header: InfoHeader(
      title: 'Riverpod Example',
    ),
    body: InfoList<String>(
      items: ref.watch(itemsProvider),
      buildItem: (item) => ListTile(title: Text(item)),
    ),
  ),
)
```

### Custom Header Implementation

You can create your own header by extending the InfoHeaderBase class:

```dart
class CustomHeader extends InfoHeaderBase {
  const CustomHeader({
    required this.title,
    required this.searchBar,
    super.key,
  });

  final String title;
  final Widget searchBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          searchBar,
        ],
      ),
    );
  }
}

// Usage
InfoCard(
  header: CustomHeader(
    title: 'Search',
    searchBar: SearchBar(),
  ),
  body: InfoList(...),
)
```

## Additional information

For more examples and detailed documentation, visit our [GitHub repository](https://github.com/tokkaiiii/flutter_list_ui).

## Contributing

Feel free to file issues and PRs! We welcome all contributions.
