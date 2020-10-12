import 'package:flutter/material.dart';
import 'package:getclub/services/deeplink.dart';
import 'package:provider/provider.dart';

class PaymentWidget extends StatefulWidget {
  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              child: Center(
                  child: Text('No deep link was used  ',
                      style: Theme.of(context).textTheme.headline6)));
        } else {
          return Container(
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Redirected: ${snapshot.data}',
                          style: Theme.of(context).textTheme.headline6))));
        }
      },
    );
  }
}
