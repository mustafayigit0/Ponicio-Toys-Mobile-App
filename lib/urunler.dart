// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ponicio/hakkimizda.dart';
import 'package:ponicio/iletisim.dart';
import 'package:ponicio/urundetay.dart';

class Urunler extends StatefulWidget {
  const Urunler({Key? key}) : super(key: key);

  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> {
  late Future<List<Urun>> urunListFuture;

  @override
  void initState() {
    super.initState();
    urunListFuture = loadUrunList();
  }

  Future<List<Urun>> loadUrunList() async {
    return await Future.delayed(Duration(seconds: 0), () async {
      String jsonData = await rootBundle.loadString('assets/urun_detay.json');
      List<dynamic> jsonList = json.decode(jsonData);
      List<Urun> urunList =
          jsonList.map((json) => Urun.fromJson(json)).toList();
      return urunList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst kısım: Logo ve Butonlar
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 16,
                right: 16,
              ),
              child: Image.asset(
                'assets/images/ponicio.png',
                fit: BoxFit.contain,
                height: 100,
              ),
            ),
            SizedBox(height: 10.0),
            // Butonlar
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    'iletisim.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Iletisim()),
                      );
                    },
                  ),
                  const SizedBox(width: 5.0),
                  buildButton(
                    'hakkimizda.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Hakkimizda()),
                      );
                    },
                  ),
                  const SizedBox(width: 5.0),
                  buildButton(
                    'urunler.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Urunler()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: FutureBuilder<List<Urun>>(
                future: urunListFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Urun> urunListesi = snapshot.data!;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 2 / 2.5,
                      ),
                      itemCount: urunListesi.length,
                      itemBuilder: (context, index) {
                        return buildProductItem(urunListesi[index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            // Alt kısım: Metin
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '2019 Yılından itibaren Polesie Türkiye',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String imagePath, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              'assets/images/$imagePath',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductItem(Urun urun) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UrunDetay(
              urunAdi: urun.urunAdi,
              urunFotograflari: urun.urunFotograflari,
              ozellikler: urun.ozellikler,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(
                  color: Colors.black,
                  width: 0.6,
                ),
              ),
              child: Image.asset(
                urun.urunFotograflari[0],
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            urun.urunAdi,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Örnek bir ürün listesi
class Urun {
  String urunAdi;
  List<String> urunFotograflari;
  List<Map<String, String>> ozellikler;

  Urun(this.urunAdi, this.urunFotograflari, this.ozellikler);

  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(
      json['urunAdi'],
      List<String>.from(json['urunFotograflari']),
      (json['ozellikler'] as List)
          .map((ozellik) => {
                "ad": ozellik['ad'].toString(),
                "deger": ozellik['deger'].toString(),
              })
          .toList(),
    );
  }
}
