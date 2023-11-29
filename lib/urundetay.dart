import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class UrunDetay extends StatelessWidget {
  final String urunAdi;
  final List<String> urunFotograflari = [
    'assets/images/about.jpg',
    'assets/images/about.jpg',
    'assets/images/about.jpg',
    'assets/images/about.jpg',
    // İhtiyacınıza göre fotoğraf URL'lerini ekleyin
  ];

  UrunDetay({required this.urunAdi, required List<String> ozellikler, required List<String> urunFotograflari});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(urunAdi),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ürün Bilgileri
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      '$urunAdi',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Özellikleri',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  ListTile(
                    contentPadding: EdgeInsets.all(
                        0), // ListTile'lar arasındaki boşluğu azaltmak için
                    title: Container(
                      width: double.infinity,
                      child: Text(
                        'Renk: Mavi',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Container(
                      width: double.infinity,
                      child: Text(
                        'Boyutlar: 10x10 cm',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Container(
                      width: double.infinity,
                      child: Text(
                        'Malzeme: Plastik',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Container(
                      width: double.infinity,
                      child: Text(
                        'Üretim Yeri: Türkiye',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),

            // Fotoğraflar
            Container(
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: PhotoViewGallery.builder(
                          itemCount: urunFotograflari.length,
                          builder: (context, index) {
                            return PhotoViewGalleryPageOptions(
                              imageProvider:
                                  AssetImage(urunFotograflari[index]),
                              minScale: PhotoViewComputedScale.contained,
                              maxScale: PhotoViewComputedScale.contained * 2,
                            );
                          },
                          backgroundDecoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          scrollPhysics: BouncingScrollPhysics(),
                          pageController: PageController(),
                        ),
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  urunFotograflari[0],
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Diğer Fotoğraflar
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: urunFotograflari.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // 1. numaralı resmi zaten üstte gösterdik, devam et
                    return Container();
                  }

                  return Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    width: MediaQuery.of(context).size.width / 3 - 10,
                    child: Image.asset(
                      urunFotograflari[index],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
