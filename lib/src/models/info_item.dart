import 'package:flutter/material.dart';

/// A basic model class for info items that can be used with [InfoList].
/// Users can extend this class or create their own model that implements [InfoItemBase].
abstract class InfoItemBase {
  const InfoItemBase();

  /// The title of the info item
  String get title;

  /// The subtitle of the info item
  String get subtitle;

  /// Optional icon for the info item
  IconData? get icon => Icons.info_outline;

  /// Optional trailing icon for the info item
  IconData? get trailingIcon => Icons.chevron_right;

  /// Optional onTap callback
  VoidCallback? get onTap => null;
}

/// A default implementation of [InfoItemBase]
class InfoItem extends InfoItemBase {
  const InfoItem({
    required this.title,
    required this.subtitle,
    this.icon,
    this.trailingIcon,
    this.onTap,
  });

  @override
  final String title;

  @override
  final String subtitle;

  @override
  final IconData? icon;

  @override
  final IconData? trailingIcon;

  @override
  final VoidCallback? onTap;
}
