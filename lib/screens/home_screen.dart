import 'package:flutter/material.dart';
import 'package:untitled/models/bills_data.dart';
import 'package:untitled/screens/add_bill_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        title: Text('Medical Bill App'),
      ),
      body: Consumer<BillsData>(
        builder: (context, billsData, child) {
          return ListView.builder(
            itemCount: billsData.bills.length,
            itemBuilder: (context, index) {
              final bill = billsData.bills[index];
              return ListTile(
                title: Text(bill.patientName),
                subtitle: Text(bill.hospitalName),
                trailing: Text('\$${bill.billAmount}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBillScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    ), onWillPop: () async=>false);
  }
}
