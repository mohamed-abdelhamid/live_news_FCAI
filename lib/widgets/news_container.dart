import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../news_model/news_model.dart';



// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {

  final index;
  final data ;
  late News _news;

  NewsContainer({this.index, this.data,}){
    _news = News(
        data['title'],
        data['source']['name'],
        data['url']
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blue,width: 1.0),
          boxShadow:[
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
            style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            _news.title,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Visit website',
              style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = () async {
                await launch(_news.url) ;
              },
            ),
          ),
        ],
      ),
    );
  }
}
