import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_list_ui/flutter_list_ui.dart';
import 'package:flutter_list_ui/src/models/info_item.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Scaffold(
        body: MyInfo(),
      ),
    );
  }
}

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: MyInfoCard(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: CustomInfoList(
            items: const [
              CustomItem(
                name: 'Basic Items with Long Title',
                description: 'This is a very long description that should make the item wider and enable horizontal scrolling. The text will continue to be very long and will require horizontal scrolling within the item itself.',
                isActive: true,
              ),
              CustomItem(
                name: 'SliverList Example with Long Title',
                description: 'Another long description to make the item wider and ensure horizontal scrolling works properly. This is a very long text that will definitely require horizontal scrolling within the item.',
                isActive: false,
              ),
              CustomItem(
                name: 'Another Sliver Item with Long Title',
                description: 'Yet another long description to demonstrate horizontal scrolling functionality. The text is intentionally made very long to show the horizontal scrolling behavior within each item.',
                isActive: true,
              ),
              CustomItem(
                name: 'Fourth Item with Long Title',
                description: 'This is the fourth item with a long description to ensure scrolling works',
                isActive: false,
              ),
              CustomItem(
                name: 'Fifth Item with Long Title',
                description: 'The fifth item with a long description to demonstrate horizontal scrolling',
                isActive: true,
              ),
            ],
            useSliver: true,
            buildItem: (item) => SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Icon(
                      item.isActive ? Icons.check_circle : Icons.circle_outlined,
                      color: item.isActive ? Colors.blue : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: item.isActive ? Colors.blue : null,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Vertical List',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: CustomInfoList(
            items: const [
              CustomItem(
                name: 'First Vertical Item',
                description: 'This is the first item in the vertical list',
                isActive: true,
              ),
              CustomItem(
                name: 'Second Vertical Item',
                description: 'This is the second item in the vertical list',
                isActive: false,
              ),
              CustomItem(
                name: 'Third Vertical Item',
                description: 'This is the third item in the vertical list',
                isActive: true,
              ),
              CustomItem(
                name: 'Fourth Vertical Item',
                description: 'This is the fourth item in the vertical list',
                isActive: false,
              ),
              CustomItem(
                name: 'Fifth Vertical Item',
                description: 'This is the fifth item in the vertical list',
                isActive: true,
              ),
            ],
            useSliver: true,
            buildItem: (item) => ListTile(
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
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Compact List',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: CustomInfoList(
            items: const [
              CustomItem(
                name: 'Compact Item 1',
                description: 'A more compact list item design',
                isActive: true,
              ),
              CustomItem(
                name: 'Compact Item 2',
                description: 'With smaller padding and different style',
                isActive: false,
              ),
              CustomItem(
                name: 'Compact Item 3',
                description: 'Perfect for dense information display',
                isActive: true,
              ),
            ],
            useSliver: true,
            itemPadding: const EdgeInsets.symmetric(vertical: 4.0),
            buildItem: (item) => ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              title: Text(
                item.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: item.isActive ? Colors.blue : null,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              subtitle: Text(
                item.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: Icon(
                item.isActive ? Icons.check_circle : Icons.circle_outlined,
                size: 20,
                color: item.isActive ? Colors.blue : null,
              ),
              trailing: const Icon(Icons.chevron_right, size: 20),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Card Style List',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: CustomInfoList(
            items: const [
              CustomItem(
                name: 'Card Item 1',
                description: 'A card-style list item with elevation',
                isActive: true,
              ),
              CustomItem(
                name: 'Card Item 2',
                description: 'With rounded corners and shadow',
                isActive: false,
              ),
              CustomItem(
                name: 'Card Item 3',
                description: 'Perfect for highlighting important items',
                isActive: true,
              ),
            ],
            useSliver: true,
            itemPadding: const EdgeInsets.symmetric(vertical: 8.0),
            itemDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            buildItem: (item) => ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              title: Text(
                item.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: item.isActive ? Colors.blue : null,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              subtitle: Text(
                item.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: item.isActive ? Colors.blue.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  item.isActive ? Icons.check_circle : Icons.circle_outlined,
                  color: item.isActive ? Colors.blue : Colors.grey,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: item.isActive ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyInfoCard extends InfoCard {
  MyInfoCard({super.key})
      : super(
          header: MyInfoHeader(),
          body: InfoList.info(
            items: const [],
            useSliver: true,
          ),
          useSliver: true,
        );
}

class MyInfoHeader extends InfoHeader {
  MyInfoHeader({super.key})
      : super(
          title: 'My App',
          subtitle: 'Example of Info UI Package',
        );
}

// Example 1: Using the default InfoList with InfoItem
class MyInfoList extends InfoList<InfoItem> {
  MyInfoList({super.key})
      : super(
          items: const [
            InfoItem(
              title: 'title 1',
              subtitle: 'subtitle 1',
              icon: Icons.star,
              onTap: null, // Handle tap
            ),
            InfoItem(
              title: 'title 2',
              subtitle: 'subtitle 2',
              icon: Icons.favorite,
              onTap: null, // Handle tap
            ),
          ],
          backgroundColor: Colors.white,
          buildItem: (item) => _buildItem(item),
        );

  static Widget _buildItem(InfoItem item) {
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
  CustomInfoList({
    super.key,
    required List<CustomItem> items,
    bool useSliver = false,
    Widget Function(CustomItem item)? buildItem,
    EdgeInsetsGeometry? itemPadding,
    BoxDecoration? itemDecoration,
  }) : super(
          items: items,
          backgroundColor: Colors.white,
          buildItem: buildItem ?? _buildItem,
          useSliver: useSliver,
          itemPadding: itemPadding,
          itemDecoration: itemDecoration,
        );

  static Widget _buildItem(CustomItem item) {
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
