
import 'package:flutter/material.dart';

import 'package:news_go/models/sneaker_model.dart';
import 'package:news_go/services/sneaker_api.dart';

List<sneaker>? sns;
bool isloading = true;

class HomePage1 extends StatefulWidget {

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  getsns() async{
      sns = await getSneaker();
      setState((){
        isloading = false;
      });
  }
  @override
  void initState() {
    super.initState();
    getsns();
  }
  Widget build(BuildContext context) {
    return Scaffold(

        body: isloading?
        Center(child: CircularProgressIndicator(),)
            :ListView.builder(
            itemCount: sns!.length,
            itemBuilder: (BuildContext contex,int index){
              return Card(
                  child:Image.network(sns![index].imageUrl),
              );
            })
    );
  }
}