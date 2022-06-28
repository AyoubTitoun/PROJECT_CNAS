import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../buildingcontext/assuredetails.dart';
import '../../../constants.dart';
import '../dashboard/header.dart';

class controldetailspage extends StatefulWidget {
  const controldetailspage({Key? key}) : super(key: key);

  @override
  _assuredetailspage createState() => _assuredetailspage();
}

class _assuredetailspage extends State<controldetailspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(0),
              child: Header(),
            ),
            SizedBox(height: defaultPadding + 10),
            Container(
              padding: EdgeInsets.all(0),
              alignment: Alignment.topLeft,
              child: Text(
                "Détails de contrôleur ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //SizedBox(width: (MediaQuery.of(context).size.width) / 2),
            SizedBox(height: defaultPadding * 2),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nom de contrôleur",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "BENICHOU",
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
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Prénom de contrôleur",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Younes",
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
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Email de contrôleur",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "ia_titoun@esi.dz",
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
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Numéro de contrôleur",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "05545454545",
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
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Adresse de contrôleur",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "XXXXXXXXXX",
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
                  width: defaultPadding * 2,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      width: 270,
                      height: 270,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(border: Border.all()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Siége de CNAS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 17),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "1er siège",
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
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Text(
                          "Numéro de bureau",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 17),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "KN 120",
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
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
