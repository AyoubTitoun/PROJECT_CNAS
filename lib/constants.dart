import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF648CFF);
const bgColor = Color(0xFF212332);
const defaultPadding = 16.0;

final buttonenvoyer = FloatingActionButton.extended(
  backgroundColor: Colors.red,
  onPressed: () {},
  label: Text(
    "Envoyer",
    style: TextStyle(color: Colors.white, fontSize: 17),
  ),
);
