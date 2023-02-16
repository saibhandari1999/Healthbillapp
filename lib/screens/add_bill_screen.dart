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

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Patient name'),
                  onChanged: (value) {
                    setState(() {
                      patientName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Patient address'),
                  onChanged: (value) {
                    setState(() {
                      patientAddress = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter patient address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Hospital name'),
                  onChanged: (value) {
                    setState(() {
                      hospitalName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter hospital name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Date of service'),
                  onChanged: (value) {
                    setState(() {
                      dateOfService = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date of service';
                    }
                    // Check if the date is valid
                    try {
                      DateTime.parse(value);
                    } catch (e) {
                      return 'Please enter a valid date in the format yyyy-mm-dd';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Bill amount'),
                  onChanged: (value) {
                    setState(() {
                      billAmount = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter bill amount';
                    }
                    // Check if the bill amount is a valid number
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid bill amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newBill = Bill(
                        patientName: patientName,
                        patientAddress: patientAddress,
                        hospitalName: hospitalName,
                        dateOfService: dateOfService,
                        billAmount: billAmount,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SummaryScreen(
                            bill: newBill,
                            isEditing: false,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ));
  }
}
