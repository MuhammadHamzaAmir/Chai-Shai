import "package:flutter/material.dart";


final textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: (Colors.pink[700])!, width: 2.0),
  ),
);