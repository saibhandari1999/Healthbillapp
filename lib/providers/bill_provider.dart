import 'package:flutter/material.dart';
import 'package:untitled/models/bill.dart';

class BillProvider with ChangeNotifier {
  List<Bill> _bills = [];

  List<Bill> get bills => _bills;

  void addBill(Bill bill) {
    _bills.add(bill);
    notifyListeners();
  }

  void updateBill(int index,Bill bill) {
    if (index >= 0) {
      _bills[index] = bill;
      notifyListeners();
    }
  }

  // void deleteBill(Bill bill) {
  //   _bills.removeLast();
  // }


}
