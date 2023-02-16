import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/bill.dart';
import 'package:untitled/models/bills_data.dart';
import 'package:untitled/providers/bill_provider.dart';
import 'package:untitled/screens/summary_screen.dart';

import 'home_screen.dart';

class EditBillScreen extends StatefulWidget {
  final int index;
  final Bill bill;

  const EditBillScreen({Key? key, required this.index, required this.bill})
      : super(key: key);

  @override
  _EditBillScreenState createState() => _EditBillScreenState();
}

class _EditBillScreenState extends State<EditBillScreen> {
  late String patientName;
  late String patientAddress;
  late String hospitalName;
  late String dateOfService;
  late String billAmount;

  @override
  void initState() {
    super.initState();
    // Set the initial values of the text fields to the values of the bill being edited.
    // final bill = Provider.of<BillsData>(context,listen: false).bills[widget.index];
    patientName = widget.bill.patientName;
    patientAddress = widget.bill.patientAddress;
    hospitalName = widget.bill.hospitalName;
    dateOfService = widget.bill.dateOfService;
    billAmount = widget.bill.billAmount;
  }

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Bill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Patient name'),
              onChanged: (value) {
                setState(() {
                  patientName = value;
                });
              },
              controller: TextEditingController(text: patientName),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Patient address'),
              onChanged: (value) {
                setState(() {
                  patientAddress = value;
                });
              },
              controller: TextEditingController(text: patientAddress),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Hospital name'),
              onChanged: (value) {
                setState(() {
                  hospitalName = value;
                });
              },
              controller: TextEditingController(text: hospitalName),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Date of service'),
              onChanged: (value) {
                setState(() {
                  dateOfService = value;
                });
              },
              controller: TextEditingController(text: dateOfService),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Bill amount'),
              onChanged: (value) {
                setState(() {
                  billAmount = value;
                });
              },
              controller: TextEditingController(text: billAmount),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final editedBill = Bill(
                  patientName: patientName,
                  patientAddress: patientAddress,
                  hospitalName: hospitalName,
                  dateOfService: dateOfService,
                  billAmount: billAmount,
                );

                // Provider.of<BillsData>(context, listen: false).addBill(editedBill);
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryScreen(
                      bill: editedBill,
                      isEditing: false,
                    ),
                  ),);
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
