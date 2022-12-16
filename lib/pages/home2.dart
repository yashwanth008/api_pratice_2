
import 'package:flutter/material.dart';
import 'package:news_go/components/sneakerCard.dart';

import 'package:news_go/models/sneaker_model.dart';
import 'package:news_go/services/sneaker_api.dart';

List<sneaker>? sns;
bool isLoading = true;

class HomePage1 extends StatefulWidget {

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  getSns() async{
      sns = await getSneaker();
      setState((){
        isLoading = false;
      });
  }
  @override
  void initState() {
    super.initState();
    getSns();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,size:25,))
          ],
          backgroundColor: Colors.black,
          centerTitle: true,
          title:const Text(
            "SneakeR HousE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName: Text(
                    "yashwanth paladugu",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("yashwanth@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "Y",
                      style: TextStyle(fontSize: 30.0, color: Colors.orange),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(' My Orders '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text(' Go Premium '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: isLoading?
        const Center(child: CircularProgressIndicator(),)
            :ListView.builder(
            shrinkWrap: true,
            itemCount: sns!.length,
            itemBuilder: (BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: sneakerCard(title: sns![index].title, brand: sns![index].brand, price: sns![index].price.toString(), imageUrl: sns![index].imageUrl),
              );
            })
    );
  }
}