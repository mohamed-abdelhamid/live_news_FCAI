import 'dart:async';
import 'package:flutter/material.dart';
import '../news_model/news_api.dart';
import '../widgets/news_container.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  late StreamController _streamController;
  late Stream _stream;
  late NewsApi _newsApi;

  @override
  void initState() {
    super.initState();
    _streamController= StreamController();
    _stream = _streamController.stream;
    _newsApi= NewsApi();
    getNews();
  }


  getNews()async{
    var response = await _newsApi.getNews();
    _streamController.add(response);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text('My News',style: TextStyle(fontSize: 30.0),),),
        body: Center(
          child: StreamBuilder(
            stream: _stream,
              builder: (context,snapshot){
                if(snapshot.hasData) {
                  var myData = snapshot.data as Map;
                  return ListView.builder(
                    itemCount: myData['articles'].length,
                    itemBuilder: (context, i) =>
                        NewsContainer(
                          data: myData['articles'][i],
                          index: i,
                        ),
                  );
                }
                return CircularProgressIndicator();
              }
          ),
        ),
      ),
    );
  }
}


