// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class UrunDetay extends StatelessWidget {
  final String urunAdi;
  final List<String> urunFotograflari;
  final List<Map<String, String>> ozellikler;

  UrunDetay({
    required this.urunAdi,
    required this.urunFotograflari,
    required this.ozellikler,
  });

  void _showGalleryForSmallImages(BuildContext context, int initialIndex) {
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
                imageProvider: AssetImage(urunFotograflari[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 2,
              );
            },
            backgroundDecoration: BoxDecoration(
              color: Colors.transparent,
            ),
            scrollPhysics: BouncingScrollPhysics(),
            pageController: PageController(initialPage: initialIndex),
          ),
        ),
      ),
    );
  }

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
                      urunAdi,
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
                    child: Column(
                      children: [
                        Text(
                          'Özellikleri',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4.0),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Container(
                            width: double.infinity,
                            child: Column(
                              children: ozellikler
                                  .map((ozellik) => Text(
                                        '${ozellik['ad']}: ${ozellik['deger']}',
                                        textAlign: TextAlign.center,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
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
                  _showGalleryForSmallImages(context, 0);
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Image.asset(
                    urunFotograflari.isNotEmpty ? urunFotograflari[0] : '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Diğer Fotoğraflar
            Container(
              height: 300.0,
              child: Column(
                children: List.generate(
                  (urunFotograflari.length - 1) ~/ 3,
                  (rowIndex) {
                    return Row(
                      children: List.generate(
                        3,
                        (colIndex) {
                          final index = rowIndex * 3 + colIndex + 1;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _showGalleryForSmallImages(context, index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 5,
                                  left: 5,
                                  top: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: Image.asset(
                                  urunFotograflari[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
