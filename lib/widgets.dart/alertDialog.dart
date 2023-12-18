import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final int? maxLines;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;

  const AlertDialogWidget(
      {super.key,
      this.maxLines,
      required this.name,
      this.controller,
      this.onEditingComplete,
      this.validator,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            validator: validator,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            maxLines: maxLines,
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          )
        ],
      ),
    );
  }
}
