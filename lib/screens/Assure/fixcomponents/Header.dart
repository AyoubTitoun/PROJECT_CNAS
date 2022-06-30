import 'package:admin/screens/Assure/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

import '../../../responsive.dart';
import '../../Login/loginpage.dart';
import '../buildingcontext/assure.dart';
import '../buildingcontext/priseencharge.dart';
import '../buildingcontext/reclamation.dart';
import '../buildingcontext/transport.dart';
import '../dashboard/header.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Container(
        color: primaryColor,
        margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        padding: EdgeInsets.fromLTRB(20,7.5,10,0),
        child: SingleChildScrollView(
          primary: false,
          
          child: Column(
            children: [
              Container(
                // height: 65,
                // width: 65,
                child: HeaderAssure(),
              ),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
  
}

