import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_go/models/sneaker_model.dart';

Map? mapbody;
List? listresponse;
List<sneaker>? snks;

Future<List<sneaker>?> getSneaker()async {
    var uri = Uri.https('v1-sneakers.p.rapidapi.com', 'v1/sneakers',
    {"limit": "25"});
    final response = await http.get(uri,
  headers: {
  "x-rapidapi-host": "v1-sneakers.p.rapidapi.com",
  "x-rapidapi-key": "4f5510a3e7msh312b35961c2ab0ep15f260jsn402663ba4338",
  "useQueryString": "true"
  });

if(response.statusCode == 200){
    mapbody = json.decode(response.body);
    //listresponse = mapbody?.();
    List _temp = [];
    for(var i in mapbody?['results']){
    _temp.add(i);
    }
    snks = sneaker.sneakersFromSnapshot(_temp);
}
return snks;

}