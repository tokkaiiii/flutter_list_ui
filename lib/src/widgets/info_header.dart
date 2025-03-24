import 'package:flutter/material.dart';

/// A header widget interface that can be implemented for custom headers.
/// This widget is typically used as part of an [InfoCard].
/// 
/// You can either:
/// 1. Use the default implementation with [InfoHeader.standard]
/// 2. Create your own implementation by extending [InfoHeader]
abstract class InfoHeader extends StatelessWidget {
  const InfoHeader({super.key});

  /// Creates a standard header with title and optional subtitle.
  /// 
  /// Example:
  /// ```dart
  /// InfoHeader.standard(
  ///   title: 'My Header',
  ///   subtitle: 'Optional subtitle',
  ///   backgroundColor: Colors.white,
  /// )
  /// ```
  factory InfoHeader.standard({
    required String title,
    String? subtitle,
    Widget? trailing,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    bool showBottomBorder = true,
    Key? key,
  }) = StandardInfoHeader;
}

/// The default implementation of [InfoHeader].
/// Provides a standard header layout with title, optional subtitle, and trailing widget.
class StandardInfoHeader extends InfoHeader {
  const StandardInfoHeader({
    required this.title,
    this.subtitle,
    this.trailing,
    this.padding,
    this.backgroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.showBottomBorder = true,
    super.key,
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

  /// Whether to show a border at the bottom of the header
  final bool showBottomBorder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: showBottomBorder ? Border(
          bottom: BorderSide(
            color: theme.dividerColor,
            width: 1,
          ),
        ) : null,
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

