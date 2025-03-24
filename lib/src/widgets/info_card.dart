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

  const InfoCard({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: isRound ? BorderRadius.circular(20) : null,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [header, body],
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
  final Widget Function(BuildContext, WidgetRef)? builder;

  const InfoCardWithRiverpod({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
    this.margin,
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
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: isRound ? BorderRadius.circular(20) : null,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [header, body],
      ),
    );
  }
}
