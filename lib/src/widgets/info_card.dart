import 'package:flutter/material.dart';
import 'info_header.dart';
import 'info_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A card widget that displays a header and a list of items.
/// The list can be of any type, but provides a default builder for [InfoItemBase].
class InfoCard<T> extends StatelessWidget {
  final InfoHeader header;
  final InfoList<T> body;
  final bool isRound;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const InfoCard({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardColor,
        borderRadius: isRound ? BorderRadius.circular(20) : null,
        border: Border.all(
          color: theme.dividerColor,
          width: 1,
        ),
      ),
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
class InfoCardWithRiverpod<T> extends ConsumerWidget {
  final InfoHeader header;
  final InfoList<T> body;
  final bool isRound;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, WidgetRef)? builder;

  const InfoCardWithRiverpod({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (builder != null) {
      return builder!(context, ref);
    }

    final theme = Theme.of(context);
    
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardColor,
        borderRadius: isRound ? BorderRadius.circular(20) : null,
        border: Border.all(
          color: theme.dividerColor,
          width: 1,
        ),
      ),
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
