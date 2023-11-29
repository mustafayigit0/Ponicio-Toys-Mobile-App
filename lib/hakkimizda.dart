import 'package:flutter/material.dart';

class Hakkimizda extends StatelessWidget {
  const Hakkimizda({Key? key}) : super(key: key);

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
                    'assets/images/about.jpg',
                    height: 200.0,
                  ),
                ],
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
