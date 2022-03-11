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
    _streamController= StreamController();  //initialize controller
    _stream = _streamController.stream;  //bind the controller to the stream
    _newsApi= NewsApi();  //initialize the NewsApi class
    getNews();
  }


  getNews()async{
    var response = await _newsApi.getNews();  // the returned list from getNews function
    _streamController.add(response);  // add the whole list to the stream
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:const Text('My News',style: TextStyle(fontSize: 30.0),),),
        body: Center(
          child: StreamBuilder(  //a widget that updates itself when the stream is updated
            stream: _stream,
              builder: (context,snapshot){
                if(snapshot.hasData) {  //make sure that there is data inside the stream
                  var myData = snapshot.data as Map;  //convert list to map
                  return ListView.builder(
                    itemCount: myData['articles'].length,
                    itemBuilder: (context, i) =>
                        NewsContainer(
                          i,
                          myData['articles'][i],
                        ),
                  );
                }
                return const CircularProgressIndicator(); //in case the data hasn't yet being added to the stream show this widget
              }
          ),
        ),
      ),
    );
  }
}


