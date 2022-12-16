import 'package:flutter/material.dart';


class sneakerCard extends StatelessWidget {

  final String brand;
  final String price;
  final String title;
  final String imageUrl;

  sneakerCard({
    required this.title,
    required this.brand,
    required this.price,
    required this.imageUrl
});


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
            imageUrl,
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            )
            ),
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            trailing:  Text(
              "\$${price}",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              brand,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize:
                  Size(MediaQuery.of(context).size.width, 56)),
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );

  }
}
