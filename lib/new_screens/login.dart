import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/new_nav.dart';

import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final _focusNodes = List.generate(5, (index) => FocusNode());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phoneNode = FocusNode();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  String selectedTab = "Email";
  String helperMessage = "";
  bool signingIn = false;
  bool codeSent = false;

  setHelperMessage(String message) {
    setState(() {
      helperMessage = message;
    });

    print(message);
  }

  @override
  void initState() {
    super.initState();
  }

  changeTab(String newTab) {
    setState(() {
      codeSent = false;
      selectedTab = newTab;
    });
  }

  signIn(BuildContext context) async {
    signingIn = true;
    helperMessage = "";
    setState(() {});

    if (selectedTab == "Phone" && codeSent) {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => NewNavigatorScreen()));

    } else {
      await signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    }
    if (selectedTab == "Phone") {
      setState(() {
        codeSent = true;
        _focusNodes[0].requestFocus();
      });
    }

    signingIn = false;
    setState(() {});
  }

  signInWithEmailAndPassword(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .onError((error, stackTrace) {
      setHelperMessage(error.toString());
      signingIn = false;
      setState(() {});
      throw ("test");
    }).then((value) {
      setHelperMessage(value.user != null ? value.user!.uid : "hmm");
      if (value.user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NewNavigatorScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.balance,
                    size: 50,
                    color: mainMaterialBlue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Lawyers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Welcome Back 👋",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: mainMaterialBlue),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Search and find lawyers instantly easier than ever",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: mainMaterialBlue.shade100.withOpacity(0.05),
                ),
                padding: EdgeInsets.all(10),
                height: 70,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => changeTab("Email"),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedTab == "Email"
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text("Email"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          changeTab("Phone");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedTab == "Phone"
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text("Phone"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 150),
                height: selectedTab == "Email"
                    ? 156
                    : codeSent
                        ? 130
                        : 60,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      selectedTab == "Phone"
                          ? Column(
                              children: [
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: mainMaterialBlue.shade100
                                        .withOpacity(0.05),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: _phoneController,
                                      focusNode: _phoneNode,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      onFieldSubmitted: (value) =>
                                          signIn(context),
                                      decoration: InputDecoration(
                                          hintText: "+973 123 456",
                                          labelText: "Phone Number",
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.phone,
                                            color: mainMaterialBlue,
                                          ),
                                          prefixIconColor:
                                              mainMaterialBlue.shade500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                !codeSent
                                    ? Container()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: mainMaterialBlue
                                                      .shade100
                                                      .withOpacity(0.05)),
                                              child: TextField(
                                                focusNode: _focusNodes[0],
                                                onChanged: (text) {
                                                  if (text.isNotEmpty)
                                                    _focusNodes[1]
                                                        .requestFocus();
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: "",
                                                ),
                                              )),
                                          Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: mainMaterialBlue
                                                      .shade100
                                                      .withOpacity(0.05)),
                                              child: TextField(
                                                focusNode: _focusNodes[1],
                                                onChanged: (text) {
                                                  if (text.isNotEmpty)
                                                    _focusNodes[2]
                                                        .requestFocus();
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: "",
                                                ),
                                              )),
                                          Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: mainMaterialBlue
                                                      .shade100
                                                      .withOpacity(0.05)),
                                              child: TextField(
                                                focusNode: _focusNodes[2],
                                                onChanged: (text) {
                                                  if (text.isNotEmpty)
                                                    _focusNodes[3]
                                                        .requestFocus();
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: "",
                                                ),
                                              )),
                                          Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: mainMaterialBlue
                                                      .shade100
                                                      .withOpacity(0.05)),
                                              child: TextField(
                                                focusNode: _focusNodes[3],
                                                onChanged: (text) {
                                                  if (text.isNotEmpty)
                                                    _focusNodes[4]
                                                        .requestFocus();
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: "",
                                                ),
                                              )),
                                          Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: mainMaterialBlue
                                                      .shade100
                                                      .withOpacity(0.05)),
                                              child: TextField(
                                                focusNode: _focusNodes[4],
                                                onChanged: (text) {
                                                  if (text.isNotEmpty) {}
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                textInputAction:
                                                    TextInputAction.done,
                                                maxLength: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: "",
                                                ),
                                              )),
                                        ],
                                      ),
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: mainMaterialBlue.shade100
                                        .withOpacity(0.05),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: _emailController,
                                      focusNode: _emailNode,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (value) =>
                                          _passwordNode.requestFocus(),
                                      decoration: InputDecoration(
                                          hintText: "example@gmail.com",
                                          labelText: "Email Address",
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                            color: mainMaterialBlue,
                                          ),
                                          prefixIconColor:
                                              mainMaterialBlue.shade500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: mainMaterialBlue.shade100
                                        .withOpacity(0.05),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      focusNode: _passwordNode,
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (value) =>
                                          signIn(context),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "*****",
                                          labelText: "Password",
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          prefixIcon: Icon(
                                            Icons.password,
                                            color: mainMaterialBlue,
                                          ),
                                          prefixIconColor:
                                              mainMaterialBlue.shade500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  helperMessage,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: InkWell(
                  onTap: signingIn ? null : () => signIn(context),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    height: 50,
                    width: signingIn ? 50 : 400,
                    decoration: BoxDecoration(
                        borderRadius: signingIn
                            ? BorderRadius.circular(180)
                            : BorderRadius.circular(15),
                        color: mainMaterialBlue.shade900),
                    child: Center(
                      child: signingIn
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white)),
                            )
                          : Text(
                              selectedTab == "Email" ? "Sign In" : "Continue",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 0.5,
                    width: 100,
                    color: Colors.black54,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                  ),
                  Container(
                    height: 0.5,
                    width: 100,
                    color: Colors.black54,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: mainMaterialBlue, width: 0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          fit: BoxFit.cover),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Google',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?\t",
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: null,
                    // () => Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => SignupScreen())),
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: mainMaterialBlue, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
