import 'package:flutter/material.dart';

// const primaryColor = Color(0xFF2697FF);
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF648CFF);
const bgColor = Color(0xFF212332);
const backgroundColorCnas = Color.fromARGB(0, 255, 255, 255);
const defaultPadding = 16.0;
const String uri = "http://localhost:3000";
// const String uri = "http://172.20.10.7:3000";

final buttonenvoyer = FloatingActionButton.extended(
  backgroundColor: Colors.blue,
  onPressed: () {},
  label: Text(
    "Envoyer",
    style: TextStyle(color: Colors.white, fontSize: 17),
  ),
);
