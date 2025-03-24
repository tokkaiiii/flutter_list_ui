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

A collection of beautiful and reusable Flutter UI components with modern design patterns. Features a flexible info card system with customizable headers and lists.

![Example](https://github.com/user-attachments/assets/06aae649-3f2b-4d51-849b-6c480e69d2e1)

## Features

- 🎨 Modern and clean design
- 📱 Responsive layout
- 🔧 Highly customizable components
- 🎯 Type-safe with generics
- 📦 Zero dependencies
- 🎭 Support for custom models
- 🎨 Flat design with customizable borders and colors
- 📏 Flexible padding and margin controls
- 🎯 Custom item builders and separators

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_list_ui: ^1.0.5
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
          subtitle: 'Optional subtitle',
        ),
        body: InfoList.info(
          items: [
            InfoItemBase(
              title: 'Item 1',
              subtitle: 'Description 1',
              icon: Icons.star,
            ),
            InfoItemBase(
              title: 'Item 2',
              subtitle: 'Description 2',
              icon: Icons.favorite,
            ),
          ],
        ),
      ),
    );
  }
}
```

### Custom Models

```dart
class Patient {
  final String name;
  final String age;
  final String diagnosis;

  Patient({
    required this.name,
    required this.age,
    required this.diagnosis,
  });
}

class PatientInfo extends Info {
  PatientInfo({super.key}) : super(
    card: InfoCard(
      header: InfoHeader(
        title: 'Patient Information',
        backgroundColor: Colors.white,
      ),
      body: InfoList<Patient>(
        items: patients,
        backgroundColor: Colors.white,
        itemPadding: const EdgeInsets.all(16),
        itemDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]!),
          ),
        ),
        buildItem: (patient) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(patient.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Age: ${patient.age}'),
            Text('Diagnosis: ${patient.diagnosis}'),
          ],
        ),
      ),
    ),
  );
}
```

### With Riverpod

```dart
class PatientList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patients = ref.watch(patientsProvider);

    return Info(
      card: InfoCard(
        header: InfoHeader(
          title: 'Patients',
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => ref.read(patientsProvider.notifier).addPatient(),
          ),
        ),
        body: InfoList<Patient>(
          items: patients,
          buildItem: (patient) => PatientListItem(patient: patient),
        ),
      ),
    );
  }
}
```

## API Reference

### Info
The main container widget that provides the basic structure.

```dart
Info({
  required InfoCard card,
  Key? key,
})
```

### InfoCard
A card widget that contains a header and body.

```dart
InfoCard({
  required InfoHeader header,
  required Widget body,
  Color? backgroundColor,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  bool isRound = false,
  Key? key,
})
```

### InfoHeader
A header widget with title and optional subtitle.

```dart
InfoHeader({
  required String title,
  String? subtitle,
  Widget? trailing,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
  TextStyle? titleStyle,
  TextStyle? subtitleStyle,
  bool showBottomBorder = true,
  Key? key,
})
```

### InfoList
A list widget that displays items with consistent styling.

```dart
InfoList<T>({
  required List<T> items,
  required Widget Function(T item) buildItem,
  Color? backgroundColor,
  EdgeInsetsGeometry? contentPadding,
  bool shrinkWrap = true,
  Widget Function(BuildContext, int)? separatorBuilder,
  ScrollPhysics? physics,
  EdgeInsetsGeometry? itemPadding,
  BoxDecoration? itemDecoration,
  Key? key,
})
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
