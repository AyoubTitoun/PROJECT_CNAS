import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'header.dart';

class transportpage extends StatefulWidget {
  const transportpage({Key? key}) : super(key: key);

  @override
  _transportpage createState() => _transportpage();
}

class _transportpage extends State<transportpage> {
  String dropdownvalue = 'Filtre 1';
  var filteritems = [
    'Filtre 1',
    'Filtreeeeeeeeeeeeeee 2',
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
              child: Header(),
            ),
            SizedBox(height: defaultPadding + 10),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    "Liste des transports ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(width: (MediaQuery.of(context).size.width) / 2),
                  SizedBox(
                    width: 596,
                  ),
                  Container(
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
                  3: FlexColumnWidth(1),
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
                  buildrow(['Nom', 'Prénom', 'Région', 'Action']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
                  buildrow(['TITOUN', 'Ayoub', 'Boumerdes', 'Voir Plus >>']),
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
                  child: Text(
                    cell,
                    style: TextStyle(color: Colors.black),
                  ),
                ))
            .toList(),
      );
}
