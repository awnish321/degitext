import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String mid = "Your_MID_Here";
  String orderId = "Order_ID_Here";
  String amount = "1.00";
  String txnToken = "Generated_Token_Here";
  bool isStaging = true;
  String callbackUrl = "";
  bool restrictAppInvoke = false;

  void startPayment() async {
    try {
      var response = AllInOneSdk.startTransaction(
          mid, orderId, amount, txnToken, "", isStaging, restrictAppInvoke);
      response.then((value) {
        print(value);
      }).catchError((error) {
        print(error);
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paytm Payment Integration'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: startPayment,
          child: const Text('Pay with Paytm'),
        ),
      ),
    );
  }
}