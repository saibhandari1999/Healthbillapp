import 'package:flutter/material.dart';
import 'package:untitled/models/bill.dart';
import 'package:untitled/models/bills_data.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/summary_screen.dart';

class AddBillScreen extends StatefulWidget {
  const AddBillScreen({Key? key}) : super(key: key);

  @override
  _AddBillScreenState createState() => _AddBillScreenState();
}

class _AddBillScreenState extends State<AddBillScreen> {
  late String patientName;
  late String patientAddress;
  late String hospitalName;
  late String dateOfService;
  late String billAmount;

  @override
  void initState() {
    super.initState();
    patientName = '';
    patientAddress = '';
    hospitalName = '';
    dateOfService = '';
    billAmount = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new bill'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Patient address'),
              onChanged: (value) {
                setState(() {
                  patientAddress = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Hospital name'),
              onChanged: (value) {
                setState(() {
                  hospitalName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Date of service'),
              onChanged: (value) {
                setState(() {
                  dateOfService = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Bill amount'),
              onChanged: (value) {
                setState(() {
                  billAmount = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final newBill = Bill(
                  patientName: patientName,
                  patientAddress: patientAddress,
                  hospitalName: hospitalName,
                  dateOfService: dateOfService,
                  billAmount: billAmount,
                );
                // Provider.of<BillsData>(context, listen: false).addBill(newBill);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryScreen(
                      bill: newBill,
                      isEditing: false,
                    ),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
