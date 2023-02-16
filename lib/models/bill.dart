import 'package:flutter/foundation.dart';

class Bill {
  final String patientName;
  final String patientAddress;
  final String hospitalName;
  final String dateOfService;
  final String billAmount;

  Bill({
    required this.patientName,
    required this.patientAddress,
    required this.hospitalName,
    required this.dateOfService,
    required this.billAmount,
  });
}
