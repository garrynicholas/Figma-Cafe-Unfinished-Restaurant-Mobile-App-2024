import 'package:flutter/material.dart';
/* ChangeNotifier adalah kelas dasar dalam Flutter yang digunakan untuk mengelola 
dan memberi tahu perubahan ke tampilan (UI) dalam aplikasi 

Ketika notifyListeners() dipanggil, metode ini memberi tahu semua pendengar (listener) bahwa objek ChangeNotifier telah mengalami perubahan
*/

class ModelCatatan extends ChangeNotifier {
  Map<String, String> _specialRequests = {};

  void updateSpecialRequest(String title, String specialRequest) {
    _specialRequests[title] = specialRequest;
    notifyListeners();
  }

  String getSpecialRequest(String title) {
    return _specialRequests[title] ?? '';
  }
}
