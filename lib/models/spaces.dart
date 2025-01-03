import 'package:flutter/material.dart';

class Space {
  final String id;
  final String title;
  final String description;
  final Color color;

  const Space({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    required this.description,
  });
}
