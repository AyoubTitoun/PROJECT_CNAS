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
  String dropdownvalue = 'Ambulance médécalisé';
  var filteritems = [
    'Ambulance médécalisé',
    'Filtre 2',
    'Filtre 3',
    'Filtre 4',
  ];
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
            SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prénom de l'assuré",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Ayoub",
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
                        "Adresse de l'assuré",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Cité 166 Logement BCR, Oued Smar",
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
            SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Catégorie de véhicule",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color(0XFFe3ebf3), //shadow for button
                                  blurRadius: 0) //blur radius of shadow
                            ],
                            color: Color.fromARGB(0, 163, 167, 172),
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Color(0XFFe3ebf3), width: 1)),
                        child: DropdownButton(
                            isExpanded: true,
                            dropdownColor: Color.fromARGB(255, 231, 227, 227),
                            style: TextStyle(color: Colors.black),
                            iconEnabledColor: Colors.black,
                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: filteritems.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            }),
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
                        "Motif de transport",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color(0XFFe3ebf3), //shadow for button
                                  blurRadius: 0) //blur radius of shadow
                            ],
                            color: Color.fromARGB(0, 163, 167, 172),
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Color(0XFFe3ebf3), width: 1)),
                        child: DropdownButton(
                            isExpanded: true,
                            dropdownColor: Color.fromARGB(255, 231, 227, 227),
                            style: TextStyle(color: Colors.black),
                            iconEnabledColor: Colors.black,
                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: filteritems.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date de début",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          ),
                          hintText: "jj/mm/aa",
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
                        "Date de fin",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          ),
                          hintText: "jj/mm/aa",
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
            SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adresse structure de soins",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Hopitale Mustapha bacha",
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
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Voir itérinaire",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Taux de remboursement",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color(0XFFe3ebf3), //shadow for button
                                  blurRadius: 0) //blur radius of shadow
                            ],
                            color: Color.fromARGB(0, 163, 167, 172),
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Color(0XFFe3ebf3), width: 1)),
                        child: DropdownButton(
                            isExpanded: true,
                            dropdownColor: Color.fromARGB(255, 231, 227, 227),
                            style: TextStyle(color: Colors.black),
                            iconEnabledColor: Colors.black,
                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: filteritems.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            }),
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
                        "Motif de transport",
                        style: TextStyle(
                            color: Color(0xFF2697FF),
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultPadding * 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buttonenvoyer,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
