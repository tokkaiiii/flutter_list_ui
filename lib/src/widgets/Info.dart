import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'InfoCard.dart';

// 기본 위젯
class Info extends StatelessWidget {
  final InfoCard card;
  final String paddingOption;
  final double paddingVertical;
  final double paddingHorizontal;
  final Color? backgroundColor;
  
  const Info({
    super.key,
    required this.card,
    this.paddingOption = 'all',
    this.paddingVertical = 8.0,
    this.paddingHorizontal = 8.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      padding: paddingOption == 'all' 
        ? EdgeInsets.all(paddingVertical)
        : EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal
          ),
      child: card,
    );
  }
}

// Riverpod 버전 위젯
class InfoWithRiverpod extends ConsumerWidget {
  final InfoCard card;
  final String paddingOption;
  final double paddingVertical;
  final double paddingHorizontal;
  final Color? backgroundColor;
  final Widget Function(BuildContext, WidgetRef)? builder;
  
  const InfoWithRiverpod({
    super.key,
    required this.card,
    this.paddingOption = 'all',
    this.paddingVertical = 8.0,
    this.paddingHorizontal = 8.0,
    this.backgroundColor,
    this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (builder != null) {
      return builder!(context, ref);
    }
    
    return Container(
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      padding: paddingOption == 'all' 
        ? EdgeInsets.all(paddingVertical)
        : EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal
          ),
      child: card,
    );
  }
}