import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsExtensions on BuildContext {
  /// Get the L10n localization.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
