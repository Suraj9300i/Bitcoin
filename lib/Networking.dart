import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'CoinList.dart';

class Networking {
  final String selectedCurrency;

  Networking({@required this.selectedCurrency});

  Future<dynamic> getData() async {
    Map<String, String> res = {};
    for (String cryptoCurrency in cryptoList) {
      String apiKey =
          "2efefa690c437382ea281586d12384768e11df93714e50bddcec672df028ef3f";
      String url =
          "https://min-api.cryptocompare.com/data/price?fsym=$cryptoCurrency&tsyms=$selectedCurrency&api_key=$apiKey ";
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        double price = jsonDecode(data)["$selectedCurrency"];
        res[cryptoCurrency] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'problem in getting http request';
      }
    }
    return res;
  }
}
