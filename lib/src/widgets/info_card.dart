import 'package:flutter/material.dart';
import 'info_header.dart';
import 'info_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A card widget that displays a header and a list of items.
/// The list can be of any type, but provides a default builder for [InfoItemBase].
class InfoCard<T> extends StatelessWidget {
  final InfoHeader header;
  final InfoList<T> body;
  final bool useSliver;
  final bool showShadow;
  final bool showDivider;

  const InfoCard({
    required this.header,
    required this.body,
    this.useSliver = false,
    this.showShadow = true,
    this.showDivider = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          header,
          if (showDivider) const Divider(height: 1),
          body,
        ],
      ),
    );

    if (useSliver) {
      return SliverToBoxAdapter(child: content);
    }

    return content;
  }
}

/// A Riverpod version of [InfoCard] that can be used with state management.
/// This widget provides the same functionality as [InfoCard] but with Riverpod integration.
///
/// The [isRound] property controls whether the card has rounded corners.
/// When true, it applies a border radius of 20 and uses [Clip.antiAlias] for proper rendering.
class InfoCardWithRiverpod<T> extends ConsumerWidget {
  final InfoHeaderBase header;
  final InfoList<T> body;
  final bool isRound;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, WidgetRef)? builder;
  final bool showBorder;
  final Color? borderColor;
  final bool useSliver;

  const InfoCardWithRiverpod({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.builder,
    this.showBorder = true,
    this.borderColor,
    this.useSliver = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (builder != null) {
      return builder!(context, ref);
    }

    final theme = Theme.of(context);
    final borderRadius = isRound ? BorderRadius.circular(20) : null;

    final decoration = BoxDecoration(
      color: backgroundColor ?? theme.cardColor,
      borderRadius: borderRadius,
      border: showBorder
          ? Border.all(
              color: borderColor ?? theme.dividerColor,
              width: 1,
            )
          : null,
    );

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        header,
        body,
      ],
    );

    if (useSliver) {
      return SliverToBoxAdapter(
        child: Container(
          margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
          padding: padding,
          decoration: decoration,
          clipBehavior: isRound ? Clip.antiAlias : Clip.none,
          child: content,
        ),
      );
    }

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
      padding: padding,
      decoration: decoration,
      clipBehavior: isRound ? Clip.antiAlias : Clip.none,
      child: content,
    );
  }
}
