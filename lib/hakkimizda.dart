// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ponicio/iletisim.dart';
import 'package:ponicio/urunler.dart';

class Hakkimizda extends StatelessWidget {
  const Hakkimizda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
            SizedBox(height: 16.0),
            // Butonlar
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
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
            ),
            // Orta kısım: Hakkımızda Görseli
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hakkımızda',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Hakkımızda görseli
                  Image.asset(
                    'assets/images/about.png',
                    height: 250.0,
                  ),
                ],
              ),
            ),
            // Alt kısım: Metin
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2019 Yılından itibaren Polesie Türkiye olarak faaliyet gösteren firmamız, 2023 Yılında yoluna kendi markası ile devam etmeye karar verdi ve PONİCİO TOYS olarak yeni bir yapılanmaya gitti.'
                    'Konumu sebebiyle fabrikamız önemli bir yere sahiptir. Sinop bir liman şehridir ve bu durum ihracatı kolaylaştırmaktadır. Fabrikamız 16.000 metrekare kapalı alan, 84.000 metrekare açık alandan oluşmaktadır. '
                    'Her zaman son teknoloji makineler ve donanımlar kullanılmaktadır. Çalışan sayımız şuan 100’den fazladır, planlamalarımız ile beraber bu sayı daha da artacaktır. Sinop’taki fabrikamızda plastik oyuncakların üretim ve montajlanmasını yapılıp, hazırlanan ürünler müşterilerimize sunulmaktadır.'
                    'Üretilen ürünler, Türkiye iç piyasasında satılmakla beraber Tüm Dünyaya ihraç edilmektedir.',
                  ),
                  Text(
                    'Misyonumuz',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Sinop’ta açtığımız fabrikamızda en son teknoloji ile donatılmış makinalarımızla çocuklarımız için üretiyoruz. Dünyanın bir ucundan diğer ucuna kadar her çocuğun hayatımızdaki değerini ve önemini çok iyi biliyoruz.'
                    'Gelişim süreçlerinde; hayallerini, hedeflerini tasarlamaları için onlara oyuncaklarımızla ilham veriyoruz.',
                  ),
                  Text(
                    'Vizyonumuz',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Oyuncaklarımız büyük uluslararası tedarikçilerden alınan en kaliteli hammaddeler ile üretilmektedir ve en önemli testlerden başarıyla geçmektedir.'
                    'Ürünlerimiz uluslararası; CE, ISO9001, ISO14001, ISO45001, EAC, G-MARK belgelerine ve sertifikalarına sahiptir.'
                    'En kaliteli hammaddeleri kullanarak elde edilen oyuncaklarımız ile her çocuğun sağlığına, gelişimine önem veriyor ve çocuklarımızın eğlence dünyasındaki yolculuklarına eşlik ediyoruz.'
                    'Öncelikle Türkiye’de daha sonra da dünyada tek bir çocuk bile oyuncaksız kalmasın istiyoruz.',
                  ),
                  Text(
                    'Hedeflerimiz',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Pazarlama ve inovasyon süreçlerinin geliştirilmesi yoluyla kârlı bir iş büyümesi ve küresel pazarlara erişim.'
                    'Müşterilerimize gerçek maliyet, yüksek kalite ve zamanında teslimat sağlayarak rekabet gücünün arttırılması.'
                    'İnsan hakları, sağlık, güvenlik ve çevre ile ilgili performansımızın güvence altına alınması ve yönetilmesi yoluyla ekonomik, sosyal ve ekolojik sürdürülebilirliğin sağlanması.',
                  ),
                ],
              ),
            ),
          ], // Column children
        ), // Column
      ), // SingleChildScrollView
    ); // Scaffold
  } // build
} // Hakkimizda
