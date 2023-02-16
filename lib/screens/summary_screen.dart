import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/bill.dart';
import 'package:untitled/providers/bill_provider.dart';
import 'package:untitled/screens/edit_bill_screen.dart';
import 'package:untitled/screens/home_screen.dart';

import '../models/bills_data.dart';
import '../providers/bill_provider.dart';

class SummaryScreen extends StatelessWidget {
  final Bill bill;
  final bool isEditing;

  const SummaryScreen({required this.bill, required this.isEditing});

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<BillProvider>(context).bills.indexOf(bill);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Summary'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Provider.of<BillProvider>(context, listen: false)
        //           .deleteBill(bill);
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.delete),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Patient Name: ${bill.patientName}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Patient Address: ${bill.patientAddress}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Hospital Name: ${bill.hospitalName}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Date of Service: ${bill.dateOfService}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Bill Amount: ${bill.billAmount}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditBillScreen(
                      bill: bill,
                      index: index,
                    ),
                  ),
                );
              },
              child: Text('Edit'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(              onPressed: () {
              final newBill = Bill(
                patientName: bill.patientName,
                patientAddress: bill.patientAddress,
                hospitalName: bill.hospitalName,
                dateOfService: bill.dateOfService,
                billAmount: bill.billAmount,
              );
              Provider.of<BillsData>(context, listen: false).addBill(newBill);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
              child: Text('Save Bill'),
            ),
          ],
        ),
      ),
    );
  }
}
