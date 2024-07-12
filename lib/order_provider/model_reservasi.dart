import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationModel extends ChangeNotifier {
  String _reservasiNumber = '';

  String get reservasiNumber => _reservasiNumber;

  void setReservasiNumber(String number) {
    _reservasiNumber = number;
    notifyListeners();
  }
}
