import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension methods for [BuildContext].
extension BuildContextExtensions on BuildContext {
  /// Get the L10n localization.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
