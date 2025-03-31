import 'package:flutter/material.dart';
import 'info_header.dart';
import 'info_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A card widget that displays a header and a list of items.
/// The list can be of any type, but provides a default builder for [InfoItemBase].
class InfoCard<T> extends StatelessWidget {
  final InfoHeaderBase header;
  final InfoList<T> body;
  final bool isRound;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  final Color? borderColor;

  const InfoCard({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.showBorder = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = isRound ? BorderRadius.circular(20) : null;

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardColor,
        borderRadius: borderRadius,
        border: showBorder
            ? Border.all(
                color: borderColor ?? theme.dividerColor,
                width: 1,
              )
            : null,
      ),
      clipBehavior: isRound ? Clip.antiAlias : Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          body,
        ],
      ),
    );
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
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (builder != null) {
      return builder!(context, ref);
    }

    final theme = Theme.of(context);
    final borderRadius = isRound ? BorderRadius.circular(20) : null;

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardColor,
        borderRadius: borderRadius,
        border: showBorder
            ? Border.all(
                color: borderColor ?? theme.dividerColor,
                width: 1,
              )
            : null,
      ),
      clipBehavior: isRound ? Clip.antiAlias : Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          body,
        ],
      ),
    );
  }
}
