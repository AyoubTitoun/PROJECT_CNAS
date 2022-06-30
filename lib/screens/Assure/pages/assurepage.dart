import 'dart:convert';

import 'package:admin/screens/Assure/pages/assureprisenechargepageDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../buildingcontext/priseencharge.dart';
import '../dashboard/header.dart';
import '../fixcomponents/Header.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../main/main_dpc_detail.dart';

Future<List<DemandePriseCharge>> fetchDPC() async {
  // final prefs = await SharedPreferences.getInstance();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.setInt('id_assure', 2);
  final int? id_assure = prefs.getInt('id_assure'); 
  final response = await http.post(
    Uri.parse(uri+'/demandes-prise-charge/assure'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      // "idAssure" : id_assure!.toInt() , 
      "idAssure" : 1 , 

  }));
  // final response = await http.get(Uri.parse(uri + '/demandes-prise-charge'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<DemandePriseCharge> demandePriseChargeList = [];
    var jsonData = jsonDecode(response.body);
    for (var demandePriseElement in jsonData) {
      DemandePriseCharge demandePriseChargeNull = DemandePriseCharge(
          id: demandePriseElement['iddemandeprisecharge'],
          nomAssure: demandePriseElement['firstname']+" "+demandePriseElement['lastname'],
          nomTransport: "---",
          etat: demandePriseElement['etat']
      );
      
      DemandePriseCharge demandePriseCharge = DemandePriseCharge(
          id: demandePriseElement['iddemandeprisecharge'],
          nomAssure: demandePriseElement['firstname']+" "+demandePriseElement['lastname'],
          nomTransport: demandePriseElement['nomsociete'],
          etat: demandePriseElement['etat']
      );
      if (demandePriseElement['nomsociete'] == null ) demandePriseChargeList.add(demandePriseChargeNull);
      else demandePriseChargeList.add(demandePriseCharge);
    }
    return demandePriseChargeList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class DemandePriseCharge {
  final int id;
  final String nomAssure;
  final String nomTransport;
  final int etat;

  const DemandePriseCharge({
    required this.id,
    required this.nomAssure,
    required this.nomTransport,
    required this.etat,
  });
}

class Assureassurepage extends StatefulWidget {
  const Assureassurepage({Key? key}) : super(key: key);

  @override
  _assureassurepage createState() => _assureassurepage();
}

Map<int, String> etat = {1:"Nouveau", 2:"En cours", 3:"En cours", 4:"Validé", 5:"terminé",6:"refusé"};

class _assureassurepage extends State<Assureassurepage> {
  String dropdownvalue = 'Filtre 1';
  var filteritems = [
    'Filtre 1',
    'Filtre 2',
    'Filtre 3',
    'Filtre 4',
  ];
  
  late Future<List<DemandePriseCharge>> futureDPC;
  @override
  void initState() {
    super.initState();
    futureDPC = fetchDPC();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColorCnas,
        ),
        child: SingleChildScrollView(
          primary: false,
          // padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding + 10),
              Container(
                padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: defaultPadding),
              Container(
                
                padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
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
                    // Container(
                    //   width: 250,
                    //   padding: EdgeInsets.only(left: 10, right: 10),
                    //   decoration: BoxDecoration(
                    //       boxShadow: <BoxShadow>[
                    //         //apply shadow on Dropdown button
                    //         BoxShadow(
                    //             color: Color.fromRGBO(
                    //                 0, 0, 0, 0.57), //shadow for button
                    //             blurRadius: 5) //blur radius of shadow
                    //       ],
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(5),
                    //       border: Border.all(color: Colors.black38, width: 1)),
                    //   child: Expanded(
                    //     child: DropdownButton(
                    //         dropdownColor: Colors.white,
                    //         style: TextStyle(color: Colors.black),
                    //         iconEnabledColor: Colors.black,
                    //         // Initial Value
                    //         value: dropdownvalue,

                    //         // Down Arrow Icon
                    //         icon: const Icon(Icons.keyboard_arrow_down),

                    //         // Array list of items
                    //         items: filteritems.map((String items) {
                    //           return DropdownMenuItem(
                    //             value: items,
                    //             child: Text(items),
                    //           );
                    //         }).toList(),
                    //         // After selecting the desired option,it will
                    //         // change button value to selected value
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             dropdownvalue = newValue!;
                    //           });
                    //         }),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: defaultPadding),
              Container(
              child: FutureBuilder<List<DemandePriseCharge>>(
              future: fetchDPC(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
              return 
              Container(
                margin: EdgeInsets.fromLTRB(50, 15, 50, 0), 
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15), 

                decoration: BoxDecoration(
                    color: Color(0xfff3f3f4), borderRadius: BorderRadius.circular(5)),
                child:  SizedBox(
                  width: double.infinity,
                  child: DataTable(
                      showCheckboxColumn: false,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Référence',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Assuré',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Société de transport',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          
                          label: Center(
                            child: Text(
                              'Etat',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        for (var element in snapshot.data!)
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(element.id.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),)),
                            DataCell(Text(element.nomAssure, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),)),
                            DataCell(Text(element.nomTransport, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),)),
                            if(element.etat == 1 ) DataCell(nouveau_etat),
                            if (element.etat == 2 ) DataCell(encours_etat),
                            if (element.etat == 3 ) DataCell(encours_etat),
                            if (element.etat == 4 ) DataCell(valide_etat),
                            if (element.etat == 5 ) DataCell(termine_etat),
                            if (element.etat == 2 ) DataCell(refuse_etat),
                          ],
                          onSelectChanged: (bool? value) {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreenAssurePriseChargeDetail(iddemandeprisecharge: element.id),
                                ),
                              );
                            });
                          },
                        ),
                      ],),
                )
                // Table(
                //   columnWidths: {
                //     0: FlexColumnWidth(2),
                //     1: FlexColumnWidth(2),
                //     2: FlexColumnWidth(2),
                //     3: FlexColumnWidth(2),
                //     4: FlexColumnWidth(2),

                //   },
                //   border: TableBorder(
                //       verticalInside: BorderSide(color: Colors.white),
                //       horizontalInside:
                //           BorderSide(color: Colors.black38, width: 1),
                //       //bottom: BorderSide(color: Colors.black38, width: 1),
                //       // top: BorderSide(color: Colors.black38, width: 1),
                //       // left: BorderSide(width: 0),
                //       // right: BorderSide(width: 0),
                //       borderRadius: BorderRadius.circular(5)),
                //   children: [
                //     buildrow([
                //       'Référence',
                //       'Assuré',
                //       'Société de transport',
                //       'Etat',
                //       'Action'
                //     ]),
                //     for (var element in snapshot.data!)
                //           buildrow([
                //             element.id.toString(),
                //             element.nomAssure,
                //             element.nomTransport,
                //             etat[element.etat].toString(),
                //             "Voir Plus >>"
                //           ])
                //           ],
                //     ),
                
                  );
                } else if (snapshot.hasError) {
                return Container(
                margin: EdgeInsets.fromLTRB(50, 15, 50, 0), 
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15), 

                decoration: BoxDecoration(
                    color: Color(0xfff3f3f4), borderRadius: BorderRadius.circular(5)),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
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
                      'Référence'
                      'Assuré',
                      'Société de transport',
                      'Etat',
                      'Action'
                    ]),
                    
                          ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ))
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildrow(List<String> cells) => TableRow(
        
        children: cells
            .map((cell) => Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: (() {
                      
                    }),
                    child: Text(
                      cell,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
            .toList(),
      );
}
