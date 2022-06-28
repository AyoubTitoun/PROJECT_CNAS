import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'header.dart';

class DashboardScreenResponsable extends StatelessWidget {
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
            SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
