// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ponicio/urunler.dart';
import 'package:ponicio/hakkimizda.dart';

class Iletisim extends StatelessWidget {
  const Iletisim({Key? key}) : super(key: key);

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
                        // Yönlendirme: Contact Sayfası
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
                    'İLETİŞİM',
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // İletişim Bilgileri
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.red, // Arka plan rengi
                    ),
                    child: Column(
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
                        // Telefon Bilgileri
                        Text(
                          'Telefon',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '+90 368 281 91 59',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '+90 368 281 91 57',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10.0),
                        // Mail Bilgileri
                        Text(
                          'Mail',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Genel',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'info@poniciotoys.com',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Satış',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'sales@poniciotoys.com',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Reklam ve Sosyal Medya',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'pr@poniciotoys.com',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10.0),
                        // Adres Bilgileri
                        Text(
                          'Adres',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Fabrika Adresi: Taşmanlı Köyü Merkez Mevkii No:67 Merkez/Sinop',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'İstanbul Ofis: Mahmutbey Mah. 2414. Sk. No:5/63 Tepe Plaza 6.Kat Ofis:34 Bağcılar/İstanbul',
                          style: TextStyle(color: Colors.white),
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
