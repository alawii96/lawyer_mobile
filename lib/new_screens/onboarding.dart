import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/new_nav.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/appData.dart';
import 'login.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  goNext(BuildContext context) {
    if (currentIndex != 2) {
      currentIndex++;
      setState(() {});
    } else {
      if (_auth.currentUser == null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPageScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NewNavigatorScreen()));
      }
    }
  }

  changeIndex(index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => appData.switchLocale(),
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: mainMaterialBlue)),
                      child: Center(
                        child: Text(
                          appData.locale.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainMaterialBlue,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Image
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/onboarding${currentIndex + 1}.png'))),
              ),
              SizedBox(
                height: 20,
              ),
              //Title
              Text(
                currentIndex == 0
                    ? AppLocalizations.of(context)!.onboardingTitle0
                    : currentIndex == 1
                        ? AppLocalizations.of(context)!.onboardingTitle1
                        : AppLocalizations.of(context)!.onboardingTitle2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              //Description
              Text(
                currentIndex == 0
                    ? AppLocalizations.of(context)!.onboardingDesc0
                    : currentIndex == 1
                        ? AppLocalizations.of(context)!.onboardingTitle1
                        : AppLocalizations.of(context)!.onboardingTitle2,
                style: TextStyle(color: Colors.black54, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              //skip, pageIndicator, next
              Spacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (_auth.currentUser == null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPageScreen()));
                      } else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => NewNavigatorScreen()));
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.skip,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => changeIndex(0),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == 0
                                  ? mainMaterialBlue
                                  : Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => changeIndex(1),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == 1
                                  ? mainMaterialBlue
                                  : Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => changeIndex(2),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == 2
                                  ? mainMaterialBlue
                                  : Colors.grey),
                        ),
                      ),
                    ],
                  )),
                  FloatingActionButton.extended(
                    backgroundColor: mainMaterialBlue,
                    onPressed: () => goNext(context),
                    label: Text(
                      currentIndex == 2
                          ? AppLocalizations.of(context)!.contin
                          : AppLocalizations.of(context)!.next,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () => goNext(context),
                  //   child: Text(
                  //     currentIndex == 2 ? "Continue" : "Next",
                  //     style: TextStyle(color: mainMaterialBlue),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
