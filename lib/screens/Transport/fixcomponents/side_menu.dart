import 'package:admin/screens/Transport/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

import '../../../responsive.dart';
import '../../Login/loginpage.dart';
import '../buildingcontext/listeprisenecharge.dart';
import '../buildingcontext/reclamation.dart';

class SideMenuTransport extends StatelessWidget {
  const SideMenuTransport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0XFF353854)),
              child: DrawerHeader(
                margin: EdgeInsets.only(left: 8, right: 0, top: 0, bottom: 0),
                padding: EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 65,
                      width: 65,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("CNAS transport", style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/images/titoun.jpg'),
              fit: BoxFit.cover,
            ),
            dense: true,
            title: Text("Benichou Younes", style: TextStyle(fontSize: 12)),
            subtitle: Text(
              "Respo trnsprts CNAS",
              style: TextStyle(color: Color(0XFFfed600), fontSize: 10),
            ),
            trailing: Icon(Icons.keyboard_arrow_down),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/dashboard.png')),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreenTransport()));
            },
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/prise.png')),
            title: Text("Listes pris en chrg"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListePriseEnCharge()),
              );
            },
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/prise.png')),
            title: Text("Dmnds pris chrg"),
            onTap: () {},
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/rembours.png')),
            title: Text("Remboursement"),
            onTap: () {},
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/reclam.png')),
            title: Text("R??clamations"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reclamation()),
              );
            },
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/param.png')),
            title: Text("Param??tres"),
            onTap: () {},
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/aide.png')),
            title: Text("Aide"),
            onTap: () {},
          ),
          ListTile(
            leading: Image(image: AssetImage('assets/images/dec.png')),
            title: Text("D??connexion"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreenLogin()));
            },
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/titoun.jpg",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("TITOUN Ayoub"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
