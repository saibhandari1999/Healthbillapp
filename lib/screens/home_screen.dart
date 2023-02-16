import 'package:flutter/material.dart';
import 'package:untitled/models/bills_data.dart';
import 'package:untitled/screens/add_bill_screen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:untitled/screens/edit_bill_screen.dart';

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
                title: Text('${bill.patientName} - \$${bill.billAmount}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bill.hospitalName),
                    Text(bill.patientAddress),
                    Text(bill.dateOfService),
                  ],
                ),

                // trailing: Text('\$${bill.billAmount}'),
                trailing: IconButton(
                  icon: Icon(MdiIcons.accountEdit), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditBillScreen(index: index, bill: bill)));
                },
                ),
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
