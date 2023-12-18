import 'package:flutter/material.dart';

class AppBarIconWidget extends StatelessWidget {
  final IconData? icon;
  const AppBarIconWidget({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        5,
      ),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300)),
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
