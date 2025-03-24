import 'package:flutter/material.dart';

/// A base interface for custom header implementations.
/// This interface is typically used when you need to create a completely custom header.
/// For most cases, you should use [InfoHeader] instead.
@immutable
abstract class InfoHeaderBase extends StatelessWidget {
  const InfoHeaderBase({super.key});

  @override
  Widget build(BuildContext context);
}

/// A header widget that can be used as part of an [InfoCard].
/// This is the default implementation that provides a standard header layout.
/// 
/// You can either:
/// 1. Use this class directly with its constructor
/// 2. Create your own implementation by extending [InfoHeaderBase]
@immutable
class InfoHeader extends StatelessWidget {
  const InfoHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.padding,
  });

  /// The title text to display
  final String title;

  /// Optional subtitle text
  final String? subtitle;

  /// Optional widget to display at the end of the header
  final Widget? trailing;

  /// Padding around the header content
  final EdgeInsetsGeometry? padding;

  /// Background color of the header
  final Color? backgroundColor;

  /// Style for the title text
  final TextStyle? titleStyle;

  /// Style for the subtitle text
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleStyle ?? theme.textTheme.titleMedium,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: subtitleStyle ?? theme.textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

