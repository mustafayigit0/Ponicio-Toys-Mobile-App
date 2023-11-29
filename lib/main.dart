import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ponicio/urunler.dart';

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
          children: [
            // Üst kısım: Logo
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Image.asset(
                'assets/images/ponicio.png',
                fit: BoxFit.contain,
              ),
            ),

            // Slider

            // Diğer öğeler
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Butonlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Yönlendirme: b2b.poniciotoys.com
                        },
                        child: Text('B2B'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Yönlendirme: Contact Sayfası
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Urunler()),
                          );
                        },
                        child: Text('Ürünler'),
                      ),
                    ],
                  ),

                  CarouselSlider(
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
                            '2019 Yılından itibaren Polesie Türkiye  olarak faaliyet gösteren firmamız, 2023 Yılında yoluna kendi markası ile devam etmeye karar verdi ve PONİCİO TOYS olarak yeni bir yapılanmaya gitti. Konumu sebebiyle fabrikamız önemli bir yere sahiptir. Sinop bir liman şehridir ve bu durum ihracatı kolaylaştırmaktadır.'),
                        SizedBox(height: 10.0),
                        Image.asset('assets/images/about.jpg', height: 200.0),
                      ],
                    ),
                  ),

                  // Ürünler
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ürünler',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        // Random ürün görselleri için bir card veya benzeri tasarım
                        // Örneğin:
                        // ProductCard(imagePath: 'assets/product1.jpg'),
                        // ProductCard(imagePath: 'assets/product2.jpg'),
                        // ProductCard(imagePath: 'assets/product3.jpg'),
                      ],
                    ),
                  ),

                  // İletişim
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // İletişim Bilgileri
                        Container(
                          padding: EdgeInsets.all(10.0),
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
                              SizedBox(height: 10.0),
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
