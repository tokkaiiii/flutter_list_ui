import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final bool removeTopPadding;
  final Widget? emptyWidget;
  final bool isLoading;
  final int skeletonCount;
  final Widget Function(BuildContext, int)? skeletonBuilder;
  final Widget Function(BuildContext, List<T>)? buildEmptyItem;
  final bool useSliver;

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
    this.removeTopPadding = false,
    this.emptyWidget,
    this.isLoading = false,
    this.skeletonCount = 3,
    this.skeletonBuilder,
    this.buildEmptyItem,
    this.useSliver = false,
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
    bool removeTopPadding = false,
    Widget? emptyWidget,
    bool isLoading = false,
    int skeletonCount = 3,
    Widget Function(BuildContext, int)? skeletonBuilder,
    Widget Function(BuildContext, List<InfoItemBase>)? buildEmptyItem,
    bool useSliver = false,
  }) {
    return InfoList<InfoItemBase>(
      key: key,
      items: items,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      shrinkWrap: shrinkWrap,
      separatorBuilder: separatorBuilder,
      physics: physics,
      removeTopPadding: removeTopPadding,
      emptyWidget: emptyWidget,
      isLoading: isLoading,
      skeletonCount: skeletonCount,
      skeletonBuilder: skeletonBuilder,
      buildEmptyItem: buildEmptyItem,
      useSliver: useSliver,
      buildItem: (item) => _buildDefaultItem(item),
    );
  }

  /// Creates an [InfoList] that handles AsyncValue data.
  /// This constructor automatically handles loading and error states.
  ///
  /// Example:
  /// ```dart
  /// InfoList.when(
  ///   value: patientData,
  ///   buildItem: (patient) => _PatientInfoItem(patient: patient),
  ///   shrinkWrap: false,
  ///   physics: const BouncingScrollPhysics(),
  ///   backgroundColor: AppColors.white,
  ///   contentPadding: EdgeInsets.zero,
  ///   itemDecoration: const BoxDecoration(
  ///     border: Border(
  ///       bottom: BorderSide(
  ///         color: AppColors.gray100,
  ///       ),
  ///     ),
  ///   ),
  /// )
  /// ```
  ///
  /// ![InfoList Example](https://github.com/user-attachments/assets/3d90b563-8e08-4da4-ae5d-f9a6d8eabe84)
  static Widget when<T>({
    required AsyncValue<List<T>> value,
    required Widget Function(T item) buildItem,
    Color? backgroundColor,
    EdgeInsetsGeometry? contentPadding,
    bool shrinkWrap = true,
    Widget Function(BuildContext, int)? separatorBuilder,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? itemPadding,
    BoxDecoration? itemDecoration,
    bool removeTopPadding = false,
    Widget? emptyWidget,
    bool isLoading = false,
    int skeletonCount = 3,
    Widget Function(BuildContext, int)? skeletonBuilder,
    Widget Function(BuildContext, List<T>)? buildEmptyItem,
  }) {
    return value.when(
      data: (items) => InfoList<T>(
        items: items,
        buildItem: buildItem,
        backgroundColor: backgroundColor,
        contentPadding: contentPadding,
        shrinkWrap: shrinkWrap,
        separatorBuilder: separatorBuilder,
        physics: physics,
        itemPadding: itemPadding,
        itemDecoration: itemDecoration,
        removeTopPadding: removeTopPadding,
        emptyWidget: emptyWidget,
        isLoading: isLoading,
        skeletonCount: skeletonCount,
        skeletonBuilder: skeletonBuilder,
        buildEmptyItem: buildEmptyItem,
      ),
      loading: () => InfoList<T>(
        items: const [],
        buildItem: (item) => const SizedBox(),
        isLoading: true,
        skeletonCount: skeletonCount,
        skeletonBuilder: skeletonBuilder,
        backgroundColor: backgroundColor,
        contentPadding: contentPadding,
        shrinkWrap: shrinkWrap,
        separatorBuilder: separatorBuilder,
        physics: physics,
        itemPadding: itemPadding,
        itemDecoration: itemDecoration,
        removeTopPadding: removeTopPadding,
      ),
      error: (error, stack) => Center(
        child: SelectableText.rich(
          TextSpan(
            text: 'Error: ',
            style: const TextStyle(color: Colors.red),
            children: [
              TextSpan(text: error.toString()),
            ],
          ),
        ),
      ),
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

  Widget _buildSkeletonItem(BuildContext context, int index) {
    if (skeletonBuilder != null) {
      return skeletonBuilder!(context, index);
    }

    return Container(
      padding: itemPadding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: itemDecoration,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 12,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildSkeletonList(context);
    }

    if (items.isEmpty) {
      if (buildEmptyItem != null) {
        return buildEmptyItem!(context, items);
      }
      return emptyWidget ??
          const Center(
            child: Text('No items found'),
          );
    }

    return _buildList(context);
  }

  Widget _buildSkeletonList(BuildContext context) {
    Widget listView = ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics ?? const ClampingScrollPhysics(),
      padding: contentPadding,
      itemCount: skeletonCount,
      separatorBuilder:
          separatorBuilder ?? (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) => _buildSkeletonItem(context, index),
    );

    if (removeTopPadding) {
      listView = MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: listView,
      );
    }

    Widget result = Container(
      color: backgroundColor,
      child: listView,
    );

    if (!shrinkWrap) {
      result = Expanded(child: result);
    }

    return result;
  }

  Widget _buildList(BuildContext context) {
    if (useSliver) {
      return SliverList(
        delegate: SliverChildListDelegate([
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                  ),
                  child: Row(
                    children: items
                        .map((item) => SizedBox(
                              width: 300,
                              child: Container(
                                padding: itemPadding,
                                decoration: itemDecoration,
                                child: buildItem(item),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ]),
      );
    }

    Widget listView = ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics ?? const ClampingScrollPhysics(),
      padding: contentPadding,
      itemCount: items.length,
      separatorBuilder:
          separatorBuilder ?? (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: itemPadding,
          decoration: itemDecoration,
          child: buildItem(item),
        );
      },
    );

    if (removeTopPadding) {
      listView = MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: listView,
      );
    }

    Widget result = Container(
      color: backgroundColor,
      child: listView,
    );

    if (!shrinkWrap) {
      result = Expanded(child: result);
    }

    return result;
  }
}
