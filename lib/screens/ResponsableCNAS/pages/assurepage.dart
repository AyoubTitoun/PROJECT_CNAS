import 'package:flutter/material.dart';

import '../buildingcontext/assuredetails.dart';
import '../../../constants.dart';
import '../dashboard/header.dart';
import '../dashboard/header.dart';

class assurepage extends StatefulWidget {
  const assurepage({Key? key}) : super(key: key);

  @override
  _assurepage createState() => _assurepage();
}

class _assurepage extends State<assurepage> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Liste des assurés ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(width: (MediaQuery.of(context).size.width) / 2),

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
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(1),
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
                  buildrow(['Nom', 'Prénom', 'Numéro SS', 'Région', 'Action']),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
                    'Voir Plus >>'
                  ]),
                  buildrow([
                    'TITOUN',
                    'Ayoub',
                    '0540181104',
                    'Boumerdes',
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
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AssureDetails()),
                      );
                    }),
                    child: Text(
                      cell,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ))
            .toList(),
      );
}
