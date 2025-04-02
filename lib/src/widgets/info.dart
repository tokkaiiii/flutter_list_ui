import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'info_card.dart';
import 'info_list.dart';

/// A widget that combines [InfoCard] and [InfoList] with consistent styling.
class Info extends StatelessWidget {
  final Widget? card;
  final Widget? body;
  final EdgeInsetsGeometry? padding;
  final bool useSliver;
  final bool showDivider;

  const Info({
    this.card,
    this.body,
    this.padding,
    this.useSliver = false,
    this.showDivider = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        if (card != null) card!,
        if (showDivider && card != null && body != null)
          const Divider(height: 1),
        if (body != null) body!,
      ],
    );

    final paddedContent = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: content,
    );

    if (useSliver) {
      return SliverToBoxAdapter(child: paddedContent);
    }

    return paddedContent;
  }
}

/// A Riverpod-aware version of [Info].
class InfoWithRiverpod extends ConsumerWidget {
  final Widget? card;
  final Widget? body;
  final EdgeInsetsGeometry? padding;
  final bool useSliver;
  final bool showDivider;

  const InfoWithRiverpod({
    this.card,
    this.body,
    this.padding,
    this.useSliver = false,
    this.showDivider = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = Column(
      children: [
        if (card != null) card!,
        if (showDivider && card != null && body != null)
          const Divider(height: 1),
        if (body != null) body!,
      ],
    );

    final paddedContent = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: content,
    );

    if (useSliver) {
      return SliverToBoxAdapter(child: paddedContent);
    }

    return paddedContent;
  }
}
