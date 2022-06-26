import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../dashboard/header.dart';

class Assureprisenechargepage extends StatefulWidget {
  const Assureprisenechargepage({Key? key}) : super(key: key);

  @override
  _assurepage createState() => _assurepage();
}

class _assurepage extends State<Assureprisenechargepage> {
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
              child: HeaderAssure(),
            ),
            SizedBox(height: defaultPadding + 10),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Text(
                "Demande  de prise en charge ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              //SizedBox(width: (MediaQuery.of(context).size.width) / 2),
            ),
            SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nom de l'assuré",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "TITOUN",
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
                    ],
                  ),
                ),
                SizedBox(
                  width: 120,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Numéro sécurité social",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "10034XXXX",
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
