import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/login.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewProfilePage extends StatefulWidget {
  const NewProfilePage({super.key});

  @override
  State<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email = "Alawii96";
  bool wifiOnly = false;

  changeSwitchWifi(bool val) {
    wifiOnly = val;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_auth.currentUser != null) {
      email = _auth.currentUser?.email ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: AppLocalizations.of(context)!.profile,
      child: Container(
        color: Colors.grey.shade300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.persofoto.com/images/vorher-nachher/passfoto-beispiel-nachher.jpg'),
                      minRadius: 30,
                      maxRadius: 45,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Ali AlQattan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    email,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 130,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: mainMaterialBlue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.editProfile,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.content),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.monetization_on,
                      color: Colors.black,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.purchases,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.preferences),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.language,
                      color: Colors.black,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.languages,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "English",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.support),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.help,
                      color: Colors.black,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.helpSupport,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.contact_page_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.terms,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(),
    );
  }
}
