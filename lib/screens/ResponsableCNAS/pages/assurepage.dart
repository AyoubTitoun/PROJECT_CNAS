import 'package:flutter/material.dart';

import '../buildingcontext/assuredetails.dart';
import '../../../constants.dart';
import '../dashboard/header.dart';
import '../dashboard/header.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Assure>> fetchAssure() async {
  final response = await http.get(Uri.parse(uri + '/assures'));
  if (response.statusCode == 200) {

    List<Assure> assures = [];
    var jsonData = jsonDecode(response.body);
    for (var assureElement in jsonData) {
      // print(assureElement);
      // print(assureElement['nss']);
      // assures.add();
      // assures.add(Assure));
      Assure assure = Assure(
          nss: assureElement['nss'],
          firstname: assureElement['firstname'],
          lastname: assureElement['lastname'],
          id: assureElement['id'],
          region: assureElement['region']);
      assures.add(assure);
      // print(assureElement);
    }
    // print(assures[0].firstname);
    return assures;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Assure {
  final int id;
  final String nss;
  final String firstname;
  final String lastname;
  final String region;

  const Assure(
      {required this.id,
      required this.nss,
      required this.firstname,
      required this.lastname,
      required this.region});

  // factory Assure.fromJson(Map<String, dynamic> json) {
  //   return Assure(
  //     id: json['id'],
  //     nss: json['nss'],
  //     firstname: json['firstname'],
  //     lastname: json['lastname']);
  // }
}

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

  // late Future<Assure> assures;

  // @override
  // void initState() {
  //   super.initState();
  //   assures = fetchAssure();
  // }
  // getAssures() async {
  //   var response = await http.get(Uri.parse('http://localhost:3000/assures'));
  //   var jsonData = jsonDecode(response.body);
  //   return jsonData;
  // }

  // listAssure() {
  //       // var AssureJson = get
  //       List<Assure> elements = futureAssures;
  //       elements.forEach( (Assure assure) {

  //       } );
  //       // foreac ( var e in elements){
  //       //   buildrow([jsonElement['lastname'],jsonElement['firstname'],jsonElement['nss'],jsonElement['region'],'Voir Plus >>']);
  //       // }
  // }
  late Future<List<Assure>> futureAssures;

  @override
  void initState() {
    super.initState();
    futureAssures = fetchAssure();
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
                  //   Center(
                  //   child: FutureBuilder<Assure>(
                  //     future: assures,
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         print(snapshot.data);
                  //         return Text(snapshot.data!.firstname);
                  //       } else if (snapshot.hasError) {
                  //         return Text('${snapshot.error}');
                  //       }

                  //       // By default, show a loading spinner.
                  //       return const CircularProgressIndicator();
                  //     },
                  //   ),
                  // ),
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
              child: FutureBuilder<List<Assure>>(
                future: futureAssures,
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
                          buildrow([
                            'Nom',
                            'Prénom',
                            'Numéro SS',
                            'Région',
                            'Action'
                          ]),
                          for (var element in snapshot.data!)
                            buildrow([
                              element.firstname,
                              element.lastname,
                              element.nss,
                              "tlemcen",
                              "voir Plus >>"
                            ])
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
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
