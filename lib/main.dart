// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ponicio/hakkimizda.dart';
import 'package:ponicio/iletisim.dart';
import 'package:ponicio/urunler.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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

            // Slider

            // Diğer öğeler
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Butonlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Iletisim(),
                              ),
                            );
                            // Yönlendirme: Hakkımızda Sayfası
                          },
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
                                'assets/images/iletisim.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0), // Add space between images
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Hakkimizda(),
                              ),
                            );
                            // Yönlendirme: Hakkımızda Sayfası
                          },
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
                                'assets/images/hakkimizda.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0), // Add space between images
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Urunler(),
                              ),
                            );
                          },
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
                                'assets/images/urunler.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                      ),
                      child: CarouselSlider(
                        items: [
                          Image.asset(
                            'assets/images/slider1.jpg',
                            fit: BoxFit.cover,
                            height: screenHeight,
                          ),
                          Image.asset(
                            'assets/images/slider2.jpg',
                            fit: BoxFit.cover,
                            height: screenHeight,
                          ),
                          Image.asset(
                            'assets/images/slider3.jpg',
                            fit: BoxFit.cover,
                            height: screenHeight,
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                        ),
                      ),
                    ),
                  ),

                  // Hakkımızda
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hakkımızda',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        // Hakkımızda metni ve görseli
                        Text(
                          '2019 Yılından itibaren Polesie Türkiye  olarak faaliyet gösteren firmamız, 2023 Yılında yoluna kendi markası ile devam etmeye karar verdi ve PONİCİO TOYS olarak yeni bir yapılanmaya gitti. Konumu sebebiyle fabrikamız önemli bir yere sahiptir. Sinop bir liman şehridir ve bu durum ihracatı kolaylaştırmaktadır.',
                        ),
                        SizedBox(height: 10.0),
                        Image.asset('assets/images/about.png', height: 250.0),
                      ],
                    ),
                  ),

                  // Ürünler
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ürünler',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          // JSON verilerini çek
                          FutureBuilder(
                            // FutureBuilder ile asenkron işlemleri yönetiyoruz
                            future: getProductsFromJson(
                                context), // JSON verilerini alacak asenkron fonksiyon
                            builder: (context, snapshot) {
                              // Veri geldiğinde
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                // Check if data is not null
                                if (snapshot.data != null) {
                                  // Data is not null, proceed with processing
                                  List<Product> products = snapshot.data!;
                                  return GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                    ),
                                    itemCount: products.length,
                                    itemBuilder: (context, index) {
                                      String productName =
                                          products[index].urunAdi;
                                      String imageUrl =
                                          products[index].urunFotograflari[0];

                                      return ProductCard(
                                        productName: productName,
                                        imageUrl: imageUrl,
                                      );
                                    },
                                  );
                                } else {
                                  // Data is null, handle accordingly
                                  return Text('Data is null');
                                }
                              } else {
                                // Veri gelene kadar bir yükleniyor göstergesi göster
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // İletişim
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // İletişim Bilgileri
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.red, // Arka plan rengi
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bize Ulaşın',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Yazı rengi
                                ),
                              ),
                              SizedBox(height: 5.0),
                              ListTile(
                                title: Text(
                                  '+90 368 281 91 59',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '+90 368 281 91 57',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'info@poniciotoys.com',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Fabrika Adresi: Taşmanlı Köyü Merkez Mevkii No:67 Merkez/Sinop',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'İstanbul Ofis: Mahmutbey Mah. 2414. Sk. No:5/63 Tepe Plaza 6.Kat Ofis:34 Bağcılar/İstanbul',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String imageUrl;

  ProductCard({required this.productName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0), // Set to 0 for flat bottom
          bottomRight: Radius.circular(0.0), // Set to 0 for flat bottom
          topLeft: Radius.circular(0.0), // Adjust as needed for top corners
          topRight: Radius.circular(0.0), // Adjust as needed for top corners
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Product Image
          Container(
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ), // AssetImage kullanarak lokal dosyadan okuma
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Product Name
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              productName,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String urunAdi;
  final List<String> urunFotograflari;

  Product({required this.urunAdi, required this.urunFotograflari});

  // JSON'dan nesneyi oluşturan factory metodu
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      urunAdi: json['urunAdi'],
      urunFotograflari:
          List<String>.from(json['urunFotograflari']), // Listeyi dönüştür
    );
  }
}

// JSON verilerini çekmek için asenkron bir fonksiyon
Future<List<Product>> getProductsFromJson(BuildContext context) async {
  String jsonString =
      await DefaultAssetBundle.of(context).loadString('assets/urun_detay.json');

  List<dynamic> jsonList = json.decode(jsonString);

  // JSON listesini Product nesnelerine dönüştür
  List<Product> products =
      jsonList.map((json) => Product.fromJson(json)).toList();

  return products;
}
