import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:news_go/models/articles.dart';
import 'package:news_go/services/newsApi.dart';


List<Article>? art;
bool isloading = true;



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getart() async{
    art = await apicall();
    setState((){
      isloading = false;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (art == null)?
      const Center(child: CircularProgressIndicator(),)
      :ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: art!.length,
        itemBuilder: (BuildContext context,int index){
              return Card(
                child: Text(
                  art![index].title,
                ),
              );
    },


    )
    );
  }
}

