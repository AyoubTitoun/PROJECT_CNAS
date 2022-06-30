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

final nouveau_etat = Container(
  width: 110,
  height: 50,
  child: Card(
    borderOnForeground: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
          style: BorderStyle.solid, width: 2, color: Color(0XFFdc3545)),
    ),
    color: Color(0XFFdc3545),
    child: Center(
      child: Text(
        "Nouveau",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
);
final arefaire_etat = Container(
  width: 110,
  height: 50,
  child: Card(
    borderOnForeground: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
          style: BorderStyle.solid, width: 2, color: Color(0XFFfd7e14)),
    ),
    color: Color(0XFFfd7e14),
    child: Center(
      child: Text(
        "À refaire",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
);
final refuse_etat = Container(
  width: 110,
  height: 50,
  child: Card(
    borderOnForeground: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
          style: BorderStyle.solid, width: 2, color: Color(0XFFffc107)),
    ),
    color: Color(0XFFffc107),
    child: Center(
      child: Text(
        "Refusé",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
);
final encours_etat = Container(
  width: 110,
  height: 50,
  child: Card(
    borderOnForeground: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
          style: BorderStyle.solid, width: 2, color: Color(0XFF17a2b8)),
    ),
    color: Color(0XFF17a2b8),
    child: Center(
      child: Text(
        "En cours",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
);
final valide_etat = Container(
  width: 110,
  height: 50,
  child: Card(
    borderOnForeground: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
          style: BorderStyle.solid, width: 2, color: Color(0XFF28a745)),
    ),
    color: Color(0XFF28a745),
    child: Center(
      child: Text(
        "Validé",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
);
final termine_etat = Container(
  width: 110,
  height: 50,
  child: Card(
    borderOnForeground: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
          style: BorderStyle.solid, width: 2, color: Color(0XFF6c757d)),
    ),
    color: Color(0XFF6c757d),
    child: Center(
      child: Text(
        "Terminé",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
);

final validerbutton = FloatingActionButton.extended(
  backgroundColor: Color(0XFF28a745),
  onPressed: () {},
  icon: Icon(
    Icons.check,
    color: Colors.white,
  ),
  label: Text(
    "Valider",
    style: TextStyle(color: Colors.white, fontSize: 17),
  ),
);
final refuser_button = FloatingActionButton.extended(
  backgroundColor: Color(0XFFffc107),
  onPressed: () {},
  icon: Icon(
    Icons.close,
    color: Colors.white,
  ),
  label: Text(
    "Refuser",
    style: TextStyle(color: Colors.white, fontSize: 17),
  ),
);
final terminer_button = FloatingActionButton.extended(
  backgroundColor: Color(0XFF6c757d),
  onPressed: () {},
  icon: Icon(
    Icons.arrow_drop_down_circle_outlined,
    color: Colors.white,
  ),
  label: Text(
    "Terminer",
    style: TextStyle(color: Colors.white, fontSize: 17),
  ),
);
