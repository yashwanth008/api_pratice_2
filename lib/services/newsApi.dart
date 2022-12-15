import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_go/models/articles.dart';


String? stringResponse;
Map? mapResponse;
List? listResponse;
List<Article>? articles;

Future<List<Article>?> apicall() async {
    http.Response response;
    response = await http.get(
        Uri.parse(
            "https://newsapi.org/v2/everything?domains=timesnownews.com&apiKey=d2259c3d1020450fb40a67bbd9c011c6",
        ),
    );

    if (response.statusCode == 200) {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["articles"];
        articles = Article.articleFromArray(listResponse);
    }

    return articles;
}