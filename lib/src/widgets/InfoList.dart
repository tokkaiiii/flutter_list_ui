import 'package:flutter/material.dart';

abstract class InfoList extends StatelessWidget {
  final List<dynamic> items;
  final Color? backgroundColor;

  const InfoList({
    super.key,
    required this.items,
    this.backgroundColor,
  });

  Widget buildItem(dynamic item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).colorScheme.background,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return buildItem(item);
        },
      ),
    );
  }
}
