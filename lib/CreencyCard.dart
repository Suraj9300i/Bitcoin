import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String cryptoCurrency;
  final String currencyPrice;
  final String selectedCurrency;
  CurrencyCard({this.cryptoCurrency, this.currencyPrice, this.selectedCurrency});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blueAccent,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("1 $cryptoCurrency = $currencyPrice $selectedCurrency",style: TextStyle(
                fontSize: 25.0,
                color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }
}
