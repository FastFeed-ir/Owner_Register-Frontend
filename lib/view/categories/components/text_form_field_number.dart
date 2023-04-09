import 'package:flutter/material.dart';

Widget textFormFieldNumber(TextEditingController controller, String label) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        filled: true,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white10)),
      ),
    ),
  );
}
