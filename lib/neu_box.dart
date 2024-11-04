// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900, // Dark background color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Dark shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.6), // Darker shadow
            blurRadius: 15,
            offset: Offset(4, 4),
          ),
          // Light shadow
          BoxShadow(
            color: Colors.grey.shade800, // Light shadow for a dark background
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: child, // Display the child widget
    );
  }
}
