import 'package:flutter/material.dart';

typedef Json = Map<String, dynamic>;

class ThemeModel {
  ThemeModel(
    this.name,
    this.color,
    this.lightTheme,
    this.darkTheme,
  );
  factory ThemeModel.fromJson(Json json) {
    return ThemeModel(
      json['name'] == null ? '' : json['name'] as String,
      json['color'] == null ? Colors.black : json['color'] as Color,
      json['light'] == null ? '' : json['light'] as String,
      json['dark'] == null ? '' : json['dark'] as String,
    );
  }
  final String name;
  final Color color;
  final String lightTheme;
  final String darkTheme;
}
