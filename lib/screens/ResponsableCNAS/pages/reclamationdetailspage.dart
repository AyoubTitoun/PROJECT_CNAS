import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../dashboard/header.dart';

class reclamationDetailspage extends StatefulWidget {
  const reclamationDetailspage({Key? key}) : super(key: key);

  @override
  _assurepage createState() => _assurepage();
}

class _assurepage extends State<reclamationDetailspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              child: Header(),
            ),
            SizedBox(height: defaultPadding + 10),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Text(
                "Détails d'une réclamation ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              //SizedBox(width: (MediaQuery.of(context).size.width) / 2),
            ),
            SizedBox(height: defaultPadding / 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Rédigez une réclamation",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: defaultPadding * 2),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Objet de la réclamation",
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Color(0XFFe3ebf3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    maxLines: 18,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Le Corps de la réclamation",
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Color(0XFFe3ebf3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                buttonenvoyer,
              ],
            )
          ],
        ),
      ),
    );
  }
}
