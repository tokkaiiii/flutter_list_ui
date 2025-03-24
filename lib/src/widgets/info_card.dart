import 'package:flutter/material.dart';
import 'info_header.dart';
import 'info_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoCard extends StatelessWidget {
  final InfoHeader header;
  final InfoList body;
  final bool isRound;
  final Color? backgroundColor;

  const InfoCard({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: isRound ? BorderRadius.circular(20) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [header, body],
      ),
    );
  }
}

class InfoCardWithRiverpod extends ConsumerWidget {
  final InfoHeader header;
  final InfoList body;
  final bool isRound;
  final Color? backgroundColor;
  final Widget Function(BuildContext, WidgetRef)? builder;

  const InfoCardWithRiverpod({
    super.key,
    required this.header,
    required this.body,
    this.isRound = false,
    this.backgroundColor,
    this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (builder != null) {
      return builder!(context, ref);
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: isRound ? BorderRadius.circular(20) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [header, body],
      ),
    );
  }
}
