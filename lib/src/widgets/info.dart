import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'info_card.dart';

/// A widget that displays an [InfoCard] with customizable padding options.
/// This widget is typically used as a container for information display.
class Info extends StatelessWidget {
  final InfoCard card;
  final String paddingOption;
  final double paddingVertical;
  final double paddingHorizontal;

  const Info({
    super.key,
    required this.card,
    this.paddingOption = 'all',
    this.paddingVertical = 8.0,
    this.paddingHorizontal = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
      padding: paddingOption == 'all' 
        ? EdgeInsets.all(paddingVertical)
        : EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal,
          ),
      child: card,
    );
  }
}

/// A Riverpod-enabled version of the [Info] widget.
/// This widget provides the same functionality as [Info] but with Riverpod integration.
class InfoWithRiverpod extends ConsumerStatefulWidget {
  final InfoCard card;
  final String paddingOption;
  final double paddingVertical;
  final double paddingHorizontal;

  const InfoWithRiverpod({
    super.key,
    required this.card,
    this.paddingOption = 'all',
    this.paddingVertical = 8.0,
    this.paddingHorizontal = 8.0,
  });

  @override
  ConsumerState<InfoWithRiverpod> createState() => _InfoWithRiverpodState();
}

class _InfoWithRiverpodState extends ConsumerState<InfoWithRiverpod> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
      padding: widget.paddingOption == 'all' 
        ? EdgeInsets.all(widget.paddingVertical)
        : EdgeInsets.symmetric(
            vertical: widget.paddingVertical,
            horizontal: widget.paddingHorizontal,
          ),
      child: widget.card,
    );
  }
} 