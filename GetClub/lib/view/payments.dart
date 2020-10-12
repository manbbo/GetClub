import 'package:flutter/material.dart';
import 'package:getclub/widgets/payment_widget.dart';

// 5155901222280001 cartao teste credito
// 4012001037141112 cartao debito
// 06/22
// 777

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return new PaymentWidget();
  }
}
