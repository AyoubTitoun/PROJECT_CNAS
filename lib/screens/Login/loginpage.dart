import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/Transport/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Assure/main/main_screen.dart';

import '../ResponsableCNAS/main/main_screen.dart';

TextEditingController txtController = TextEditingController();

class MainScreenLogin extends StatelessWidget {
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
              onPressed: () {
                if (txtController.text == '1') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                } else {
                  if (txtController.text == '2') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreenAssure()));
                  } else {
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
