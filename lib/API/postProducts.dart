import 'dart:async';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'dart:convert';

// class Name {
//   final String first;
//   final String last;
//
//   const Name({required this.first,required this.last});
//
//   factory Name.fromJson(Map<String, dynamic> json) {
//     return Name(first: json['first'], last: json['last']);
//   }
// }
// class User {
//   final String email;
//   final String picture;
//   final Name name;
//
//   const User({
//     required this.email,
//     required this.picture,
//     required this.name,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//         email: json['email'],
//         picture: json['picture']['medium'],
//         name: Name.fromJson(json['name']));
//   }
// }

class Product{
    var name;
    var price;
    var ratingsAverage;
    var image;
    Product({ //first constractor
     required this.name,
     required this.price,
     required this.ratingsAverage,
     required this.image});

   factory Product.fromJson(Map<String,dynamic> json){
     //second constractor where it take map(Key:value),key is String and Value is Dynamic
     //factory is not crating new abject but use avalibel one
     return Product(name: json['title'], price: json['price'], ratingsAverage: json['ratingsAverage'], image: json['imageCover']);
   }
}



class postProducts {
  Future<List<Product>> getProducts() async {  //return List of Users
    final response = await http.get(Uri.parse("https://route-ecommerce.onrender.com/api/v1/products"));
    print(jsonDecode(response.body)['data'][0]);
    if (response.statusCode == 200) { // no error in request
      final data = jsonDecode(response.body); //Change string to JSON object
      final List<Product> list = [];
      print('before the loooooop');
      print(' ${data["data"].length}');
      print(' ${data["data"][1]} ');
      for (int i = 0; i < data["data"].length; i++) {
        var singleProduct = data["data"][i];
        list.add(Product.fromJson(data["data"][i]));
      }
      print('fist item ${list[0]}');
      return list;
    } else { // error in request
      throw Exception("Failed");
    }
  }
}