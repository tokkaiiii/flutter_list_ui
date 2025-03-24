import 'package:flutter/material.dart';
import '../models/info_item.dart';

/// A list widget that displays items with a consistent style.
/// It can be used with any type of item, but provides a default builder for [InfoItemBase].
class InfoList<T> extends StatelessWidget {
  final List<T> items;
  final Color? backgroundColor;
  final Widget Function(T item) buildItem;
  final EdgeInsetsGeometry? contentPadding;
  final bool shrinkWrap;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? itemPadding;
  final BoxDecoration? itemDecoration;

  const InfoList({
    required this.items,
    required this.buildItem,
    this.backgroundColor,
    this.contentPadding,
    this.shrinkWrap = true,
    this.separatorBuilder,
    this.physics,
    this.itemPadding,
    this.itemDecoration,
    super.key,
  });

  /// Creates a default [InfoList] that works with [InfoItemBase] items.
  /// This is a convenience constructor that provides a default item builder.
  static InfoList<InfoItemBase> info({
    Key? key,
    required List<InfoItemBase> items,
    Color? backgroundColor,
    EdgeInsetsGeometry? contentPadding,
    bool shrinkWrap = true,
    Widget Function(BuildContext, int)? separatorBuilder,
    ScrollPhysics? physics,
  }) {
    return InfoList<InfoItemBase>(
      key: key,
      items: items,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      shrinkWrap: shrinkWrap,
      separatorBuilder: separatorBuilder,
      physics: physics,
      buildItem: (item) => _buildDefaultItem(item),
    );
  }

  static Widget _buildDefaultItem(InfoItemBase item) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      leading: item.icon != null ? Icon(item.icon) : null,
      trailing: item.trailingIcon != null ? Icon(item.trailingIcon) : null,
      onTap: item.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView.separated(
        shrinkWrap: shrinkWrap,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        padding: contentPadding,
        itemCount: items.length,
        separatorBuilder: separatorBuilder ?? (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            padding: itemPadding,
            decoration: itemDecoration,
            child: buildItem(item),
          );
        },
      ),
    );
  }
}
