import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../ResponsableCNAS/buildingcontext/assuredetails.dart';
import '../../ResponsableCNAS/dashboard/header.dart';

class Assureassurepage extends StatefulWidget {
  const Assureassurepage({Key? key}) : super(key: key);

  @override
  _assurepage createState() => _assurepage();
}

class _assurepage extends State<Assureassurepage> {
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
                    "Mes Demandes prise en charge ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(width: (MediaQuery.of(context).size.width) / 2),

                  buttonajouter,
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
