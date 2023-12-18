import 'package:flutter/material.dart';

class ProductColorsWidget extends StatelessWidget {
  final Color? color;
  const ProductColorsWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(7))),
      width: 21,
      height: 22,
    );
  }
}
