import 'package:flutter/material.dart';
import 'package:lawyer_mobile/new_screens/contract-fill.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';

import '../main.dart';

class ContractsList extends StatefulWidget {
  const ContractsList({super.key});

  @override
  State<ContractsList> createState() => _ContractsListState();
}

class _ContractsListState extends State<ContractsList> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Available Contracts",
      floatingActionButton: Container(),
      // FloatingActionButton.extended(
      //     onPressed: () {}, label: Text("Purchased Contracts")),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 47.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: mainMaterialBlue),
                  color: Colors.white),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: mainMaterialBlue,
                      ),
                      border: InputBorder.none,
                      hintText: "Search"),
                ),
              )),
          Divider(),
          ListTile(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ContractFillPage())),
            title: Text("Lease Contract"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            title: Text("Divorce Contract"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
        ],
      ),
    );
  }
}
