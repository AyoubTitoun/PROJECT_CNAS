import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../dashboard/header.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

TextEditingController categorievehiculeController = TextEditingController();
TextEditingController motiftransport = TextEditingController();

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
}

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

  int? _categorie = 1;
  int? _motif = 1;
  int? _idTransportSanitaire ;
  TextEditingController maladeController = TextEditingController();
  TextEditingController adresseMaladeController = TextEditingController();
  TextEditingController sanitaireController = TextEditingController();
  TextEditingController adresseSanitaireController = TextEditingController();
  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController nbrSeanceController = TextEditingController();
  int? _pourcentage = 1;




  bool _selected = false;
  late Future<List<Transporteur>> futureTransporteur;

  @override
  void initState() {
    super.initState();
    futureTransporteur = fetchTransporteur();
    _selected = false;
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
                        "Catégorie de véhicule",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                     Column(
                        children: <Widget>[
                          RadioListTile<int>(
                            title: const Text('Ambulance médicalisée', style: TextStyle(color: Colors.black),),
                            
                            value: 1,
                            groupValue: _categorie,
                            onChanged: (int? value) {
                              setState(() {
                                _categorie = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: const Text('Ambulance sanitaire',style: TextStyle(color: Colors.black),),
                            value: 2,
                            groupValue: _categorie,
                            onChanged: (int? value) {
                              setState(() {
                                _categorie = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: const Text('Ambulance léger',style: TextStyle(color: Colors.black),),
                            value: 3,
                            groupValue: _categorie,
                            onChanged: (int? value) {
                              setState(() {
                                _categorie = value;
                              });
                            },
                          ),
                        ],
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
                      Column(
                        children: <Widget>[
                          RadioListTile<int>(
                            title: const Text('Hospitalisation',style: TextStyle(color: Colors.black),),
                            value: 1,
                            groupValue: _motif,
                            onChanged: (int? value) {
                              setState(() {
                                _motif = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: const Text('Admission ou sortie',style: TextStyle(color: Colors.black),),
                            value: 2,
                            groupValue: _motif,
                            onChanged: (int? value) {
                              setState(() {
                                _motif = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: const Text('traitement ambulatoire',style: TextStyle(color: Colors.black),),
                            value: 3,
                            groupValue: _motif,
                            onChanged: (int? value) {
                              setState(() {
                                _motif = value;
                              });
                            },
                          ),
                        ],
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
                        "Nom et prénom de malade",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: maladeController,
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
                        "Adresse de malade",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: adresseMaladeController,
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
                        "Nom de strucutre sanitaire",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: sanitaireController,
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
                        "Adresse de strucutre sanitaire",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: adresseSanitaireController,
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
                        "Date de début",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: dateDebutController,
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
                        controller: dateFinController,
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
                        "Nombre de séance",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: nbrSeanceController,
                        
                        keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "",
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
                        "Taux de remboursement",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                      Column(
                        children: <Widget>[
                          RadioListTile<int>(
                            title: const Text('80%',style: TextStyle(color: Colors.black),),
                            value: 80,
                            groupValue: _pourcentage,
                            onChanged: (int? value) {
                              setState(() {
                                _pourcentage = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: const Text('100%',style: TextStyle(color: Colors.black),),
                            value: 100,
                            groupValue: _pourcentage,
                            onChanged: (int? value) {
                              setState(() {
                                _pourcentage = value;
                              });
                            },
                          ),
                         
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40 ,
            ),
            
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1.0,
                    vertical: 1.0,
                  ),
      
                  /// Checkbox Widget
                  
                  child: Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.black),
                  child: CheckboxListTile(
                    title: Text('Choisir vous-meme la structure sanitaire :',style: TextStyle(color: Colors.black),),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _selected,
                    
      
                    /// Toggling Checkbox value and
                    /// assigning it to _selected variable
                    onChanged: (value) => setState(() => _selected = value!),
                  ),
      
                  ),         
                ),
      
                /// if selected variable is true i.e
                /// [selected == true] then list is visible
                /// otherwise it's not
                if (_selected)
                  Container(
                child: FutureBuilder<List<Transporteur>>(
              future: fetchTransporteur(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                        children: <Widget>[
                          
                          for (var i = 0 ; i < snapshot.data!.length; i++) 
                          RadioListTile<int>(
                            
                            title: Text(snapshot.data![i].nomsociete,style: TextStyle(color: Colors.black),),
                            value: snapshot.data![i].id,
                            groupValue: _idTransportSanitaire,
                            // tileColor : Colors.black,
                            
                            onChanged: (int? value) {
                              setState(() {
                                _idTransportSanitaire = value;
                              });
                            },
                          )
                        ],
                      );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ))
            ],
            ),
            SizedBox(height: defaultPadding * 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FloatingActionButton.extended(
                

                backgroundColor: Colors.blue,
                onPressed: () async {
                    var IdTransportSanitaire;
                    if (!_selected) IdTransportSanitaire = null;
                    else IdTransportSanitaire = _idTransportSanitaire;
                    final response = await http.post(
                    Uri.parse(uri+'/demandes-prise-charge/ajouter'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, dynamic>{
                      "IdAssure" : 1 , 
                      "IdTransportSanitaire": IdTransportSanitaire,
                      "CategorieVehicule":_categorie ,// interger {medicalisee,sanitaire,leger}
                      "MotifTransport": _motif,// integer {hospitalisation,admission,ambulatoire}
                      "NomMalade" : maladeController.text,
                      "AdresseMalade": adresseMaladeController.text,
                      "NomStructureSanitaire": sanitaireController.text,
                      "adresseStructureSanitaire": adresseSanitaireController.text,
                      "DateDebutTraitement" : dateDebutController.text, 
                      "DateFinTraitement" : dateFinController.text,
                      "nbrSeances":nbrSeanceController.text,
                      // AttenteStrucutre , // boolean 
                      "TypeRemboursement" : _pourcentage , // 80 ou 100
                      "Etat": 1, // {nouveau, aRefaire, enCours, valide, termine, refuse}
                      "DateCreation": DateTime.now().toString() ,
                    }),
                  );
                  print(response.body);
                  if (response.statusCode == 200){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Demande de prise en charge'),
                        content: const Text('Une nouvelle demande de prise en charge est ajoutée'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ));
                  }else{
                    showDialog<String>(
                      context: context,
                      
                      builder: (BuildContext context) => AlertDialog(
                      
                        title: const Text('Demande de prise en charge'),
                        backgroundColor: Colors.white,
                        content: const Text('Ajout de demande de prise en charge échoué'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ));
                  }
                  
                },
                label: Text(
                  "Envoyer",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
