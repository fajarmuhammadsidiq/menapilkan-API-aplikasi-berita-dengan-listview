import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slicing_iseng/view/akunProfil.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  List _get = [];

  //paste apikey yang didapatkan dari newsapi.org
  var apikey = '80cd43057c774e2e81a028fdbb39bf2d';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  //method untuk merequest/mengambil data dari internet
  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=${apikey}"));

      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          _get = data['articles'];
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Dashboard",
            style: TextStyle(color: Colors.black),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AkunProfil();
                },
              ));
            },
            child: Icon(Icons.person, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(5),
              primary: Colors.grey, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text("List Berita"),
            ),
            //widget gridview, kita buat custom di bawah
            GridList(get: _get),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class GridList extends StatelessWidget {
  const GridList({
    Key? key,
    required List get,
  })  : _get = get,
        super(key: key);

  final List _get;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //wajib menggunakan 2 baris script di bawah ini, agar dapat digabung dengan widget lain
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // banyak grid yang ditampilkan dalam satu baris
          crossAxisCount: 2),
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          child: Column(
            children: [
              Image(
                image: NetworkImage(
                  _get[index]['urlToImage'] ??
                      "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                ),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _get[index]['title'] ?? "No Title",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),

      itemCount: _get.length,
    );
  }
}
