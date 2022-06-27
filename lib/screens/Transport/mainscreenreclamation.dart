import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/Transport/fixcomponents/side_menu.dart';
import 'package:admin/screens/Transport/pages/transportreclamationpage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenReclamation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenuTransport(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenuTransport(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Transportreclamationpage(),
            ),
          ],
        ),
      ),
    );
  }
}