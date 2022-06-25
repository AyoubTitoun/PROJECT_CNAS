import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF648CFF);
const bgColor = Color(0xFF212332);
const defaultPadding = 16.0;
final buttonajouter = FloatingActionButton.extended(
  backgroundColor: Colors.red,
  onPressed: () {},
  icon: Icon(
    Icons.add,
    color: Colors.white,
  ),
  label: Text(
    "Ajouter",
    style: TextStyle(color: Colors.white, fontSize: 17),
  ),
);
