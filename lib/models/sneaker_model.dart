class sneaker{
  final String brand;
  final int price;
  final String title;
  final String imageUrl;
  sneaker({required this.brand,required this.price,required this.title,
     required this.imageUrl
  });

  factory sneaker.fromJson(dynamic json){
    return sneaker(
      brand: json['brand'] as String,
      price: json['retailPrice'],
      title: json['title'] as String,
      imageUrl: json['media']['imageUrl'] as String,
    );
  }

  static List<sneaker> sneakersFromSnapshot(List? snapshot){
    return snapshot!.map(
            (data){
          return sneaker.fromJson(data);
        }
    ).toList();
  }
  //@override
  // String toString(){
  //   return 'sneaker{brand:$brand, gender:$gender, title: $title}';
  // }
}