import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer_mobile/new_screens/new_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class ContractFillPage extends StatefulWidget {
  const ContractFillPage({super.key});

  @override
  State<ContractFillPage> createState() => _ContractFillPageState();
}

class _ContractFillPageState extends State<ContractFillPage> {
  String downloadURL = "";
  int step = 1;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _holderController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _roadController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      _fromController.text = picked.toString().substring(0, 10);
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      _toController.text = picked.toString().substring(0, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Fill Contract",
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: step == 1
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/onboarding1.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              hintText: "First Name",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              hintText: "Last Name",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _holderController,
                      decoration: InputDecoration(
                        hintText: "Property Holder Full Name",
                      ),
                    ),
                  ],
                )
              : step == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/house.webp'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Let us know the property details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _typeController,
                          decoration: InputDecoration(
                              hintText: "type", helperText: "Propery Type"),
                        ),
                        TextFormField(
                          controller: _locationController,
                          decoration: InputDecoration(
                              hintText: "Area", helperText: "Area"),
                        ),
                        TextFormField(
                          controller: _buildingController,
                          decoration: InputDecoration(
                              hintText: "Building", helperText: "Building No."),
                        ),
                        TextFormField(
                          controller: _roadController,
                          decoration: InputDecoration(
                              hintText: "Road", helperText: "Road No."),
                        ),
                        TextFormField(
                          controller: _blockController,
                          decoration: InputDecoration(
                              hintText: "Block", helperText: "Block No."),
                        ),
                      ],
                    )
                  : step == 3
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/calendar.webp'),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Let us know about the duration",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () => _selectFromDate(context),
                              child: TextFormField(
                                controller: _fromController,
                                enabled: false,
                                decoration: InputDecoration(
                                    hintText: "Start Date",
                                    helperText: "Start Date"),
                              ),
                            ),
                            InkWell(
                              onTap: () => _selectToDate(context),
                              child: TextFormField(
                                enabled: false,
                                controller: _toController,
                                decoration: InputDecoration(
                                    hintText: "End Date",
                                    helperText: "End Date"),
                              ),
                            ),
                          ],
                        )
                      : step == 4
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/money.webp'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Lastly, we need some details regarding the price",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _priceController,
                                  decoration: InputDecoration(
                                      hintText: "Lease Price",
                                      helperText: "Monthly Price"),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/done-contract.webp'),
                                SizedBox(
                                  height: 90,
                                ),
                                Text(
                                  "Your Contract Should be downloaded shortly",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 150,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      Uri _url = Uri.parse(downloadURL);
                                      launchUrl(_url,
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Text(
                                      "Issue downloading ?\nRetry Download",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: mainMaterialBlue,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(step == 4
            ? "Generate Contract"
            : step == 5
                ? "Home"
                : "Continue"),
        icon: Icon(step == 4
            ? Icons.generating_tokens
            : step == 5
                ? Icons.home
                : Icons.arrow_forward_ios),
        onPressed: () async {
          if (step == 4) {
            final response = await http.get(Uri.parse(
                'http://10.0.2.2:8000/api/fill-data-pdf?name=${_firstNameController.text + ' ' + _lastNameController.text}&to=${_toController.text}&from=${_fromController.text}&holder=${_holderController.text}&period=${_periodController.text}&type=${_typeController.text}&building=${_buildingController.text}&road=${_roadController.text}&location=${_locationController.text}&block=${_blockController.text}&price=${_priceController.text}'));
            Uri _url = Uri.parse(response.body);
            launchUrl(_url, mode: LaunchMode.externalApplication);
            step++;
            downloadURL = response.body;
            setState(() {});
          } else if (step == 5) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NewNavigatorScreen()));
          } else {
            step++;
            setState(() {});
          }
        },
      ),
    );
  }
}
