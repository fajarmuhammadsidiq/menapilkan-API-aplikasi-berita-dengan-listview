import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slicing_iseng/homepage.dart';

class AkunProfil extends StatelessWidget {
  final List menu = [
    "Ubah Profil",
    "Setelan Keamanan",
    "F.A.Q",
    "Become A Membership Partner",
    "Laporan"
  ];
  AkunProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Setting", style: TextStyle(fontSize: 20, color: Colors.black)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AkunProfil();
                },
              ));
            },
            child: Icon(Icons.card_membership_rounded, color: Colors.green),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(5),
              primary: Colors.white, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            ),
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  menu[index],
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("ini adalah dari" + menu[index]),
                leading: CircleAvatar(
                  child: Text(menu[index][0], style: TextStyle(fontSize: 20)),
                ),
              ),
            );
          }),
          itemCount: menu.length,
        ),
      ),
    );
  }
}
