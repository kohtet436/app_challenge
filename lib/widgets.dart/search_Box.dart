import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Search here...",
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
          filled: true,
          fillColor: Colors.grey.shade100,
          suffixIcon: const Icon(
            Icons.search,
            size: 25,
          )),
    );
  }
}
