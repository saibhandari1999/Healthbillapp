import 'package:flutter/material.dart';
import 'package:untitled/models/bills_data.dart';
import 'package:untitled/providers/bill_provider.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:untitled/screens/add_bill_screen.dart';
import 'package:untitled/screens/summary_screen.dart';

void main() {
  runApp(MedicalBillApp());
}

class MedicalBillApp extends StatelessWidget {
  const MedicalBillApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(
        create: (context)=>BillsData()),ChangeNotifierProvider(create: (context)=>BillProvider())]
        ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medical Bill App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeScreen(),
        initialRoute: '/',
        routes:  { '/': (context) => HomeScreen(),
    '/add-bill': (context) => AddBillScreen(),},
      ),
    );
  }
}
