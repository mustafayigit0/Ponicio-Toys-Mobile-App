// urun_detay_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class UrunDetayService {
  Future<Map<String, dynamic>> getUrunDetayData() async {
    String data = await rootBundle.loadString('assets/urun_detay.json');
    return json.decode(data);
  }
}
