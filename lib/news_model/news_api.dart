import 'dart:convert';
import 'package:http/http.dart';

class NewsApi {
  final String url =
      "https://newsapi.org/v2/everything?q=general&from=2022-3-3&apiKey=160ff28915f54293a2832cc7ca1c51bb";

  getNews() async {
    try {
      Response response = await get(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
      );
      var list = jsonDecode(response.body);
      print(list);
      return list;
    } catch (e) {
      print(e);
    }
  }
}
