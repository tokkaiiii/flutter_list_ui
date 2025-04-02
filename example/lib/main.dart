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
      home: const MyInfo(),
    );
  }
}

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Info Widget Example with Long Text',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: Info(
              useSliver: true,
              card: InfoCard(
                useSliver: false,
                header: InfoHeader(
                  title: 'User Profile Settings and Preferences',
                  subtitle: 'Manage your account settings and personal information',
                  icon: Icons.person,
                ),
                body: InfoList.info(
                  items: const [
                    InfoItem(
                      title: 'Edit Profile Information and Personal Details',
                      subtitle: 'Update your personal information, contact details, and profile picture',
                      icon: Icons.edit,
                      trailingIcon: Icons.chevron_right,
                    ),
                    InfoItem(
                      title: 'Change Password and Security Settings',
                      subtitle: 'Update your password, enable two-factor authentication, and manage security preferences',
                      icon: Icons.lock,
                      trailingIcon: Icons.chevron_right,
                    ),
                  ],
                  useSliver: false,
                ),
              ),
              body: InfoList.info(
                items: const [
                  InfoItem(
                    title: 'Notification and Alert Preferences',
                    subtitle: 'Configure your notification settings, alert frequency, and communication preferences',
                    icon: Icons.notifications,
                    trailingIcon: Icons.chevron_right,
                  ),
                  InfoItem(
                    title: 'Privacy and Data Management Settings',
                    subtitle: 'Manage your privacy settings, data sharing preferences, and account visibility options',
                    icon: Icons.privacy_tip,
                    trailingIcon: Icons.chevron_right,
                  ),
                ],
                useSliver: false,
              ),
              showDivider: true,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: Info(
              useSliver: true,
              card: InfoCard(
                useSliver: false,
                header: InfoHeader(
                  title: 'Application Settings and Configuration',
                  subtitle: 'Customize your application experience and preferences',
                  icon: Icons.settings,
                ),
                body: InfoList.info(
                  items: const [
                    InfoItem(
                      title: 'Theme and Display Preferences',
                      subtitle: 'Customize the application theme, font size, and display settings for optimal viewing experience',
                      icon: Icons.palette,
                      trailingIcon: Icons.chevron_right,
                    ),
                    InfoItem(
                      title: 'Language and Regional Settings',
                      subtitle: 'Select your preferred language, date format, and regional preferences for the application',
                      icon: Icons.language,
                      trailingIcon: Icons.chevron_right,
                    ),
                  ],
                  useSliver: false,
                ),
              ),
              body: InfoList.info(
                items: const [
                  InfoItem(
                    title: 'Storage and Cache Management',
                    subtitle: 'Manage application storage, clear cache, and optimize device storage usage',
                    icon: Icons.storage,
                    trailingIcon: Icons.chevron_right,
                  ),
                  InfoItem(
                    title: 'Network and Connectivity Settings',
                    subtitle: 'Configure network preferences, data usage limits, and offline access settings',
                    icon: Icons.wifi,
                    trailingIcon: Icons.chevron_right,
                  ),
                ],
                useSliver: false,
              ),
              showDivider: true,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          ),
        ],
      ),
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
