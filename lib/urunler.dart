import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return await Future.delayed(Duration(seconds: 2), () async {
      String jsonData = await rootBundle.loadString('assets/urun_detay.json');
      List<dynamic> jsonList = json.decode(jsonData);
      List<Urun> urunList =
          jsonList.map((json) => Urun.fromJson(json)).toList();
      return urunList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Üst kısım: Logo ve Butonlar
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/ponicio.png',
                    fit: BoxFit.contain,
                    // İstediğiniz yüksekliği ayarlayabilirsiniz
                  ),
                  SizedBox(height: 16.0),
                  // Butonlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Yönlendirme: B2B
                        },
                        child: Text('B2B'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Yönlendirme: Contact
                        },
                        child: Text('Contact'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Yönlendirme: Hakkımızda Sayfası
                        },
                        child: Text('Hakkımızda'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Yönlendirme: Ürünler Sayfası
                        },
                        child: Text('Ürünler'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Orta kısım: Hakkımızda Görseli
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
                        childAspectRatio: 2 /
                            2.5, // Değerleri ihtiyaca göre ayarlayabilirsiniz
                      ),
                      itemCount: urunListesi.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Tıklanan ürünün adını kullanarak detay sayfasına yönlendir
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunDetay(
                                  urunAdi: urunListesi[index].urunAdi,
                                  ozellikler: [],
                                  urunFotograflari:
                                      urunListesi[index].urunFotograflari,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  urunListesi[index].urunFotograflari[0],
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                urunListesi[index].urunAdi,
                                style: TextStyle(
                                  fontSize:
                                      14.0, // Değeri ihtiyaca göre ayarlayabilirsiniz
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
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
                '2019 Yılından itibaren Polesie Türkiye  olarak faaliyet gösteren firmamız, 2023 Yılında yoluna kendi markası ile devam etmeye karar verdi ve PONİCİO TOYS olarak yeni bir yapılanmaya gitti. Konumu sebebiyle fabrikamız önemli bir yere sahiptir. Sinop bir liman şehridir ve bu durum ihracatı kolaylaştırmaktadır.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Örnek bir ürün listesi
class Urun {
  String urunAdi;
  List<String> urunFotograflari;

  Urun(this.urunAdi, this.urunFotograflari);

  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(
      json['urunAdi'],
      List<String>.from(json['urunFotograflari']),
    );
  }
}
