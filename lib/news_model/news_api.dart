import 'dart:convert';
import 'package:http/http.dart';

class NewsApi {
  final String url =
      "https://newsapi.org/v2/everything?q=general&from=2022-3-11&apiKey=160ff28915f54293a2832cc7ca1c51bb";

  getNews() async {
    try {
      Response response = await get( // get is a method that is provided by the http package
          Uri.parse(url),  // Uri make sure that you are providing a valid url
          headers: {"Content-Type": "application/json"},  // telling the gateway that data is being sent and received in json format
      );
      var list = jsonDecode(response.body);  // convert from json to list from dart:convert library
      return list;
    } catch (e) {
      print(e);
    }
  }
}
