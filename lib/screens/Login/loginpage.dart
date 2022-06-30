import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/Transport/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Assure/main/main_screen.dart';

import '../ResponsableCNAS/main/main_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';




TextEditingController txtController = TextEditingController();

class MainScreenLogin extends StatelessWidget {
  
  
  
  
  void initState() async {
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Text("Login Test")),
            TextField(
              controller: txtController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'PLEASE ENTER YOUR text',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                
                if (txtController.text == '1') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                } else {
                  if (txtController.text == '2') {
                    
                    // Save an integer value to 'counter' key.
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setInt('id_assure', 2);
                    // final int? id_assure = prefs.getInt('id_assure');
                    // print(id_assure);
        
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreenAssure()));
                  } else {
                    final prefs = await SharedPreferences.getInstance();
                    // Save an integer value to 'counter' key.
                    await prefs.setInt('id_transport', 3);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreenTransport()));
                  }
                }
              },
              child: const Text("Sign In"),
            )
          ],
        ),
        // We want this side menu only for large screen
      ),
    );
  }
}
