import 'package:flutter/material.dart';
import '../configs/app_locale_delegate.dart';

import 'asset.dart';

class Translate {
  Translate(this.locale);

  final Locale locale;

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate)!;
  }

  static const LocalizationsDelegate<Translate> delegate = AppLocaleDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final jsonMap = await UtilAsset.loadJson(
      'assets/locale/${locale.languageCode}.json',
    );

    _localizedStrings = jsonMap.map((dynamic key, dynamic value) {
      return MapEntry<String, String>(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}
