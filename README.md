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

# Flutter List UI - Beautiful and Customizable List Components

A powerful Flutter package for creating beautiful and customizable list UIs with cards, headers, and async data support. Perfect for building modern Flutter applications with Material Design 3.

![Image](https://github.com/user-attachments/assets/db12dc53-322e-431d-b92f-a29f9ecf42fc)

## Features

- 🎨 **Material Design 3 Support**: Modern and beautiful UI components
- 📱 **Responsive Design**: Works on all screen sizes
- 🔄 **Async Data Support**: Built-in support for loading states
- 🎯 **Riverpod Integration**: Seamless state management
- 💫 **Shimmer Loading**: Beautiful loading animations
- 🎭 **Customizable**: Extensive styling options
- 🌐 **Cross-Platform**: Works on iOS, Android, and Web

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_list_ui: ^1.4.1
```

## Quick Start

```dart
import 'package:flutter_list_ui/flutter_list_ui.dart';

// Create a beautiful list with cards
InfoList(
  items: yourItems,
  itemBuilder: (context, item) => InfoCard(
    header: InfoHeader(title: item.title),
    body: Text(item.description),
  ),
);
```

## Documentation

- [Getting Started](https://github.com/tokkaiiii/flutter_list_ui#getting-started)
- [API Reference](https://github.com/tokkaiiii/flutter_list_ui#api-reference)
- [Examples](https://github.com/tokkaiiii/flutter_list_ui#examples)

## Windows Users

// ... existing Windows troubleshooting section ...

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Keywords

Flutter, UI, List, Card, Material Design, Riverpod, Async, Loading, Shimmer, Cross-Platform
