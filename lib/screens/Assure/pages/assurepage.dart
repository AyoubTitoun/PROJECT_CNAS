import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../buildingcontext/priseencharge.dart';
import '../dashboard/header.dart';

class Assureassurepage extends StatefulWidget {
  const Assureassurepage({Key? key}) : super(key: key);

  @override
  _assurepage createState() => _assurepage();
}

class _assurepage extends State<Assureassurepage> {
  String dropdownvalue = 'Filtre 1';
  var filteritems = [
    'Filtre 1',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mes Demandes de prise en charge ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(width: (MediaQuery.of(context).size.width) / 2),

                  FloatingActionButton.extended(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AssurePriseenCharge()),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Ajouter",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: "Numéro sécurité social",
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
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: "Nom de l'assuré",
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
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
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
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          //apply shadow on Dropdown button
                          BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.57), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38, width: 1)),
                    child: Expanded(
                      child: DropdownButton(
                          dropdownColor: Colors.white,
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
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1),
                  6: FlexColumnWidth(1),
                },
                border: TableBorder(
                    verticalInside: BorderSide(color: Colors.white),
                    horizontalInside:
                        BorderSide(color: Colors.black38, width: 1),
                    //bottom: BorderSide(color: Colors.black38, width: 1),
                    // top: BorderSide(color: Colors.black38, width: 1),
                    // left: BorderSide(width: 0),
                    // right: BorderSide(width: 0),
                    borderRadius: BorderRadius.circular(5)),
                children: [
                  buildrow([
                    'Nom',
                    'Prénom',
                    'Numéro SS',
                    'Date demande',
                    'Etat',
                    'Action'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    '19/10/2020',
                    'test',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    '19/10/2020',
                    'test',
                    'Voir Plus >>'
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow buildrow(List<String> cells) => TableRow(
        children: cells
            .map((cell) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() {}),
                    child: Text(
                      cell,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ))
            .toList(),
      );
}
