import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lawyer_mobile/mobile_admin/add_lawyer.dart';
import 'package:lawyer_mobile/mobile_admin/login.dart';
import 'package:lawyer_mobile/new_screens/login.dart';
import 'package:lawyer_mobile/new_screens/onboarding.dart';
import 'package:lawyer_mobile/providers/appData.dart';
import 'package:lawyer_mobile/screens/calling_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'new_screens/new_nav.dart';
import 'new_widgets/lawyer_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

Color mainBlue = Color.fromRGBO(4, 46, 97, 1);
// //Color mainBlue = Color.fromRGBO(255, 180, 0, 1);
Color mainYellow = Color.fromRGBO(255, 179, 0, 1);

//Real blue
MaterialColor mainMaterialBlue = const MaterialColor(0xFF042e61, {
  50: Color.fromRGBO(4, 46, 97, 0.1),
  100: Color.fromRGBO(4, 46, 97, 0.2),
  200: Color.fromRGBO(4, 46, 97, 0.3),
  300: Color.fromRGBO(4, 46, 97, 0.4),
  400: Color.fromRGBO(4, 46, 97, 0.5),
  500: Color.fromRGBO(4, 46, 97, 0.6),
  600: Color.fromRGBO(4, 46, 97, 0.7),
  700: Color.fromRGBO(4, 46, 97, 0.8),
  800: Color.fromRGBO(4, 46, 97, 0.9),
  900: Color.fromRGBO(4, 46, 97, 1)
});

MaterialColor mainMaterialYellow = const MaterialColor(0xFFFFC800, {
  50: Color.fromRGBO(255, 179, 0, 0.1),
  100: Color.fromRGBO(255, 179, 0, 0.2),
  200: Color.fromRGBO(255, 179, 0, 0.3),
  300: Color.fromRGBO(255, 179, 0, 0.4),
  400: Color.fromRGBO(255, 179, 0, 0.5),
  500: Color.fromRGBO(255, 179, 0, 0.6),
  600: Color.fromRGBO(255, 179, 0, 0.7),
  700: Color.fromRGBO(255, 179, 0, 0.8),
  800: Color.fromRGBO(255, 179, 0, 0.9),
  900: Color.fromRGBO(255, 179, 0, 1)
});

List<Widget> lawyersGridList = [
  LawyerGrid(
    name: "Ali AlQattan",
    stars: 5,
    imageURL:
        "https://www.777injury.com/wp-content/uploads/2019/01/injury-lawyer-walter-benenati.jpg",
    premium: true,
  ),
  LawyerGrid(
    name: "Someone Oliver",
    stars: 1,
    imageURL:
        "https://www.persofoto.com/images/vorher-nachher/passfoto-beispiel-nachher.jpg",
  ),
  LawyerGrid(
    name: "Oliver Wasten",
    stars: 5,
    category: "Criminal",
    imageURL:
        "https://s3-prod.crainsnewyork.com/styles/width_253/s3/Marcantonio%20Stephanie%20HS.jpg",
  ),
  LawyerGrid(name: "Ali AlQattan", stars: 6)
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/calendar.webp"), context);
    precacheImage(AssetImage("assets/done-contract.webp"), context);
    precacheImage(AssetImage("assets/house.webp"), context);
    precacheImage(AssetImage("assets/money.webp"), context);
    precacheImage(AssetImage("assets/onboarding1.png"), context);
    precacheImage(AssetImage("assets/onboarding2.png"), context);
    precacheImage(AssetImage("assets/onboarding3.png"), context);
    return ChangeNotifierProvider(
        create: (context) => AppData(), child: ConfigState());
  }
}

class ConfigState extends StatelessWidget {
  const ConfigState({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context, listen: true);
    return MaterialApp(
        title: 'Lawyers',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        locale: appData.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: mainMaterialBlue,
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: OnboardingPage()
        //kIsWeb ? AddLawyer() : OnboardingPage(),
        );
  }
}
