import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../news_model/news_model.dart';



// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {

  final int index;
  final dynamic data ;
  late News _news;

  NewsContainer(this.index, this.data, {Key? key}) : super(key: key){
    _news = News(
        data['source']['name'],
        data['title'],
        data['url']
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blue,width: 1.0),
          boxShadow:const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0.5,
              offset: Offset(2.0,2.0),
              blurRadius: 1.0,
            ),
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _news.source,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            _news.title,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () async {
              await launch(_news.url);
            },
            child: const Text(
                'Visit website',
                style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
