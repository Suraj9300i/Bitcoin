import 'package:bitcoin/CoinList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'CreencyCard.dart';
import 'Networking.dart';

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String _selectedCurrency = "USD";
  String currencyPrice;

  Map<String,String> map = {};

  DropdownButton getDropDown(){
    List<DropdownMenuItem> dropDownList = [];
    for(String currency in currenciesList){
      var temp = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownList.add(temp);
    }
    return DropdownButton(
      items: dropDownList,
      value: _selectedCurrency,
      onChanged: (value){
        setState(() {
          _selectedCurrency = value;
        });
        getCurPrice();
      },
    );
  }
  CupertinoPicker getIosPicker(){
    List<Text> pickerList = [];
    for(String currency in currenciesList){
      var newItem = Text(currency,style: TextStyle(
        color: Colors.white
      ),);
      pickerList.add(newItem);
    }
    return CupertinoPicker(
      children: pickerList,
      itemExtent: 32.0,
      backgroundColor: Colors.blueAccent,
      onSelectedItemChanged: (value){
        _selectedCurrency = currenciesList[value];
      },
    );
  }

  void getCurPrice() async{
    Networking net = Networking(selectedCurrency: _selectedCurrency);
    Map<String,String> temp = await net.getData();
    setState(() {
      map = temp;
    });
  }

  @override
  void initState(){
    super.initState();
    getCurPrice();
  }

  Column makeCard(){
    List<CurrencyCard> cardList = [];
    for(String crytoCurrency in cryptoList){
      CurrencyCard newItem = CurrencyCard(
        cryptoCurrency: crytoCurrency,
        selectedCurrency: _selectedCurrency,
        currencyPrice: map[crytoCurrency],
      );
      cardList.add(newItem);
    }
    return Column(
      children: cardList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCard(),
          Container(
            alignment: Alignment.center,
            height: 100,
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIosPicker():  getDropDown(),
          ),
        ],
      ),
    );
  }

}

