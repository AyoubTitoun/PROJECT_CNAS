import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../dashboard/header.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../fixcomponents/Header.dart';
import '../main/main_screen.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

TextEditingController categorievehiculeController = TextEditingController();
TextEditingController motiftransport = TextEditingController();

double _originLatitude = 6.5212402;
double _originLongitude = 3.3679965;
double _destLatitude = 6.849660;
double _destLongitude = 3.648190;
Map<MarkerId, Marker> markers = {};
PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};


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
          id: transporteurElement['idtransportsanitaire']);
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
  late GoogleMapController mapController;

  Set<Marker> _markers1 = Set();
  Set<Marker> _markers2 = Set();


  bool showmaps = true;
  //LatLng startLocation = LatLng(27.6683619, 85.3101895);
  //LatLng endLocation = LatLng(27.6688312, 85.3077329);
  String googleAPiKey = "AIzaSyDwCTYOj2SWL6bt2rz_k8_bcXirZtJNB3g";


  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id_assure = prefs.getInt('id_assure');
  }

  @override
  void initState() {
    super.initState();
    futureTransporteur = fetchTransporteur();
    _selected = false;
    loadData();
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
              padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
              child: Column(
                children: [
                  
                  Container(
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
                  
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Catégorie de véhicule",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),

                              ),
                             Column(
                                children: <Widget>[
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                        disabledColor: Colors.black
                                    ),
                                    child: RadioListTile<int>(
                                      title: const Text('Ambulance médicalisée', style: TextStyle(color: Colors.black),),
                                      activeColor: Colors.black,
                                      value: 1,
                                      groupValue: _categorie,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _categorie = value;
                                        });
                                      },
                                    )
                                  ),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                        disabledColor: Colors.black
                                    ),
                                    child: RadioListTile<int>(
                                      title: const Text('Ambulance sanitaire', style: TextStyle(color: Colors.black),),
                                      activeColor: Colors.black,
                                      value: 2,
                                      groupValue: _categorie,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _categorie = value;
                                        });
                                      },
                                    )
                                  ),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                        disabledColor: Colors.black
                                    ),
                                    child: RadioListTile<int>(
                                      title: const Text('Ambulance léger', style: TextStyle(color: Colors.black),),
                                      activeColor: Colors.black,
                                      value: 3,
                                      groupValue: _categorie,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _categorie = value;
                                        });
                                      },
                                    )
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
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              
                              Column(
                                children: <Widget>[
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                        disabledColor: Colors.black
                                    ),
                                    child: RadioListTile<int>(
                                      title: const Text('Hospitalisation',style: TextStyle(color: Colors.black),),
                                      value: 1,
                                      activeColor: Colors.black,
                                      groupValue: _motif,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _motif = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                        disabledColor: Colors.black
                                    ),
                                    child: RadioListTile<int>(
                                      title: const Text('Admission ou sortie',style: TextStyle(color: Colors.black),),
                                      value: 2,
                                      activeColor: Colors.black,
                                      groupValue: _motif,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _motif = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                        disabledColor: Colors.black
                                    ),
                                    child: RadioListTile<int>(
                                      title: const Text('traitement ambulatoire',style: TextStyle(color: Colors.black),),
                                      value: 3,
                                      activeColor: Colors.black,
                                      groupValue: _motif,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _motif = value;
                                        });
                                      },
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: maladeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                  hintText: "Nom & Prénom",
                                  hintStyle: TextStyle(color: Colors.grey),
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
                              "Nom de strucutre sanitaire",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: sanitaireController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                  hintText: "Hopital Moustapha bacha",
                                  hintStyle: TextStyle(color: Colors.grey),
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
                              "Adresse de malade",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: adresseMaladeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                  hintText: "Adresse",
                                  hintStyle: TextStyle(color: Colors.grey),
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
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: adresseSanitaireController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                  hintText: "Adresse ",
                                  hintStyle: TextStyle(color: Colors.grey),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Container(
                            width: 500,
                            height: 435,
                            margin: const EdgeInsets.all(0.0),
                            padding: const EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 0),
                            decoration: BoxDecoration(border: Border.all()),
                            child: showmaps
                                ? Container(
                                    padding: EdgeInsets.all(0),
                                    child: GoogleMap(
                                      onTap: (location) {
                                        _originLongitude = location.longitude;                                        
                                        _originLatitude = location.latitude;
                                        _markers1.add(Marker(
                                          //add start location marker
                                          markerId:
                                              MarkerId(location.toString()),
                                          position:
                                              location, //position of marker
                                          infoWindow: InfoWindow(
                                            //popup info
                                            title: 'Point départ ',
                                            snippet: 'Malade',
                                          ),
                                          icon: BitmapDescriptor
                                              .defaultMarker, //Icon for Marker
                                        ));
                                        setState(() {});
                                      },
                                      onMapCreated: (controller) {
                                        setState(() {
                                          mapController = controller;
                                        });
                                      },
                                      markers: Set<Marker>.of(_markers1),
                                      mapType: MapType.terrain,
                                      initialCameraPosition: CameraPosition(
                                          target: LatLng(36.7762, 3.05997),
                                          zoom: 13),
                                    ),
                                    
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.amber,
                                  )),
                      ],
                        ),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Container(
                            width: 500,
                            height: 435,
                            margin: const EdgeInsets.all(0.0),
                            padding: const EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 0),
                            decoration: BoxDecoration(border: Border.all()),
                            child: showmaps
                                ? Container(
                                    padding: EdgeInsets.all(0),
                                    child: GoogleMap(
                                      onTap: (location) {
                                        _destLongitude = location.longitude;
                                        _destLatitude = location.latitude;
                                        
                                        _markers2.add(Marker(
                                          //add start location marker
                                          markerId:
                                              MarkerId(location.toString()),
                                          position:
                                              location, //position of marker
                                          infoWindow: InfoWindow(
                                            //popup info
                                            title: 'Point d\'arrivé ',
                                            snippet: 'Structure sanitaire',
                                          ),
                                          icon: BitmapDescriptor
                                              .defaultMarker, //Icon for Marker
                                        ));
                                        setState(() {});
                                      },
                                      onMapCreated: (controller) {
                                        setState(() {
                                          mapController = controller;
                                        });
                                      },
                                      markers: Set<Marker>.of(_markers2),
                                      mapType: MapType.terrain,
                                      initialCameraPosition: CameraPosition(
                                          target: LatLng(36.7762, 3.05997),
                                          zoom: 13),
                                    ),
                                    
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.amber,
                                  )),
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
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: dateDebutController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                  hintText: "jj/mm/aa",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  
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
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: dateFinController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                  hintText: "jj/mm/aa",
                                  hintStyle: TextStyle(color: Colors.grey),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nombre de séance",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: nbrSeanceController,
                              
                              keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                  hintText: "Eg : 4 ",
                                  hintStyle: TextStyle(color: Colors.grey),
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
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Column(
                              children: <Widget>[
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.black,
                                      disabledColor: Colors.black
                                  ),
                                  child: 
                                    RadioListTile<int>(
                                    title: const Text('80%',style: TextStyle(color: Colors.black),),
                                    value: 80,
                                    activeColor: Colors.black,
                                    groupValue: _pourcentage,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _pourcentage = value;
                                      });
                                    },
                                  ),
                                ),
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.black,
                                      disabledColor: Colors.black
                                  ),
                                  child: 
                                    RadioListTile<int>(
                                    title: const Text('100%',style: TextStyle(color: Colors.black),),
                                    value: 100,
                                    activeColor: Colors.black,
                                    groupValue: _pourcentage,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _pourcentage = value;
                                      });
                                    },
                                  ),
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
                        return Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                                
                                children: <Widget>[
                                  
                                  for (var i = 0 ; i < snapshot.data!.length; i++) 
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                        disabledColor: Colors.black
                                    ),
                                    
                                    child: RadioListTile<int>(
                                      activeColor: Colors.black,
                                      title: Text(snapshot.data![i].nomsociete,style: TextStyle(color: Colors.black),),
                                      value: snapshot.data![i].id,
                                      groupValue: _idTransportSanitaire,
                                      // tileColor : Colors.black,
                                      onChanged: (int? value) {
                                        setState(() {
                                          _idTransportSanitaire = value;
                                        });
                                      },
                                    ),
                                  )
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
                  SizedBox(height: defaultPadding * 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FloatingActionButton.extended(
                      

                      backgroundColor: Color.fromRGBO(33, 150, 243, 1),
                      onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          final int? id_assure = prefs.getInt('id_assure');
                          var IdTransportSanitaire;
                          if (!_selected) IdTransportSanitaire = null;
                          else IdTransportSanitaire = _idTransportSanitaire;
                          final response = await http.post(
                          Uri.parse(uri+'/demandes-prise-charge/ajouter'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, dynamic>{
                            "IdAssure" : 1, 
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
                            "longitudeDepart" : _originLongitude, 
                            "latitudeDepart" :_originLatitude,
                            "longitudeArrive": _destLongitude, 
                            "latitudeArrive" :_destLatitude,
                            "TypeRemboursement" : _pourcentage , // 80 ou 100
                            "Etat": 1, // {nouveau, aRefaire, enCours, valide, termine, refuse}
                            "DateCreation": DateTime.now().toString() ,
                          }),
                        );
                        if (response.statusCode == 200){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Demande de prise en charge'),
                              content: const Text('Une nouvelle demande de prise en charge est ajoutée'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => { Navigator.pop(context, 'OK')},
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
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreenAssure()));
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
          ]),
        ),
      ),
    );
  }
}
