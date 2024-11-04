import 'package:flutter/material.dart';

class NeuBox1 extends StatelessWidget {
  final Widget? child;
  const NeuBox1({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900, // Dark background color
        borderRadius: BorderRadius.circular(20), // Increased radius for a smoother look
        border: Border.all(
          color: Colors.black54, // Subtle border for better definition
          width: 1,
        ),
        boxShadow: [
          // Dark shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.7), // Darker shadow for more depth
            blurRadius: 20,
            offset: Offset(5, 5),
          ),
          // Light shadow
          BoxShadow(
            color: Colors.grey.shade700, // Softer light shadow
            blurRadius: 20,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      padding: EdgeInsets.all(16), // Increased padding for better spacing
      child: child, // Display the child widget
    );
  }
}
