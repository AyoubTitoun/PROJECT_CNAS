import 'package:flutter/material.dart';

import '../../../constants.dart';
// import '../buildingcontext/transportdetails.dart';
import '../dashboard/header.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Transporteur>> fetchTransporteur() async {
  final response = await http.get(Uri.parse(uri + '/transporteurs'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Transporteur> transporteurs = [];
    var jsonData = jsonDecode(response.body);
    for (var transporteurElement in jsonData) {
      Transporteur transporteur = Transporteur(
          nomsociete: transporteurElement['nomsociete'],
          email: transporteurElement['email'],
          region: transporteurElement['region'],
          numerotelephone: transporteurElement['numerotelephone'],
          id: transporteurElement['id']);
      transporteurs.add(transporteur);
    }
    return transporteurs;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Transporteur {
  final int id;
  final String nomsociete;
  final String email;
  final String region;
  final String numerotelephone;

  const Transporteur({
    required this.id,
    required this.nomsociete,
    required this.email,
    required this.region,
    required this.numerotelephone,
  });

  // factory Transporteur.fromJson(Map<String, dynamic> json) {
  //   return Assure(
  //     id: json['id'],
  //     nss: json['nss'],
  //     firstname: json['firstname'],
  //     lastname: json['lastname']);
  // }
}

class transportpageAssure extends StatefulWidget {
  const transportpageAssure({Key? key}) : super(key: key);

  @override
  _transportpageAssure createState() => _transportpageAssure();
}

class _transportpageAssure extends State<transportpageAssure> {
  String dropdownvalue = 'Filtre 1';
  var filteritems = [
    'Filtre 1',
    'Filtreeeeeeeeeeeeeee 2',
    'Filtre 3',
    'Filtre 4',
  ];

  late Future<List<Transporteur>> futureTransporteur;

  @override
  void initState() {
    super.initState();
    futureTransporteur = fetchTransporteur();
  }

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
                    "Liste des transports ",
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
                child: FutureBuilder<List<Transporteur>>(
              future: fetchTransporteur(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(1),
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
                        buildrow([
                          'Raison social',
                          'email',
                          'Numéro',
                          'Region',
                          'Action'
                        ]),
                        for (var element in snapshot.data!)
                          buildrow([
                            element.nomsociete,
                            element.email,
                            element.numerotelephone,
                            element.region,
                            "Voir Plus >>"
                          ])
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ))
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       // builder: (context) => TransportDetails()),
                      // );
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
