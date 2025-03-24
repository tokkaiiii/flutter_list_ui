import 'package:flutter/material.dart';
import 'package:flutter_list_ui/src/widgets/info.dart';
import 'package:flutter_list_ui/src/widgets/info_card.dart';
import 'package:flutter_list_ui/src/widgets/info_header.dart';
import 'package:flutter_list_ui/src/widgets/info_list.dart';
import 'package:flutter_list_ui/src/models/info_item.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const Scaffold(
        body: MyInfo(),
      ),
    ),
  );
}

class MyInfo extends Info {
  const MyInfo({super.key}) : super(
    card: const MyInfoCard(),
  );
}

class MyInfoCard extends InfoCard {
  const MyInfoCard({super.key}) : super(
    header: const MyInfoHeader(),
    body: const MyInfoList(),
  );
}

class MyInfoHeader extends InfoHeader {
  const MyInfoHeader({super.key}) : super(
    title: 'My App',
    subtitle: 'Example of Info UI Package',
  );
}

// Example 1: Using the default InfoList with InfoItem
class MyInfoList extends InfoList<InfoItem> {
  const MyInfoList({super.key}) : super(
    items: const [
      InfoItem(
        title: '제목 1',
        subtitle: '부제목 1',
        icon: Icons.star,
        onTap: null, // Handle tap
      ),
      InfoItem(
        title: '제목 2',
        subtitle: '부제목 2',
        icon: Icons.favorite,
        onTap: null, // Handle tap
      ),
    ],
    backgroundColor: Colors.white,
  );

  @override
  Widget buildItem(InfoItem item) {
    return ListTile(
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
    );
  }
}

// Example 2: Using custom model with InfoList
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

class CustomInfoList extends InfoList<CustomItem> {
  const CustomInfoList({super.key}) : super(
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
  );

  @override
  Widget buildItem(CustomItem item) {
    return ListTile(
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
    );
  }
}
