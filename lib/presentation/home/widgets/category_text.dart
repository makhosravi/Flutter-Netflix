import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 16.0,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
