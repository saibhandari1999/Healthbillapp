import 'package:flutter/material.dart';
import 'package:untitled/models/bill.dart';

class BillsData extends ChangeNotifier {
  List<Bill> _bills = [];

  List<Bill> get bills {
    return _bills;
  }

  void addBill(Bill bill) {
    _bills.add(bill);
    notifyListeners();
  }
}
