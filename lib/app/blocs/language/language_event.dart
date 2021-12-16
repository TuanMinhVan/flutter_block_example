import 'package:flutter/material.dart';

abstract class LanguageEvent {}

class OnChangeLanguage extends LanguageEvent {
  OnChangeLanguage(this.locale);
  final Locale locale;

}
