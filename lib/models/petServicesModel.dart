// To parse this JSON data, do
//
//     final PetServicesModel = PetServicesModelFromJson(jsonString);

import 'dart:convert';

PetServicesModel petServicesModelFromJson(String str) =>
    PetServicesModel.fromJson(json.decode(str));

String petServicesModelToJson(PetServicesModel data) =>
    json.encode(data.toJson());

class PetServicesModel {
  PetServicesModel({
    this.petServices,
  });

  PetServices petServices;

  factory PetServicesModel.fromJson(Map<String, dynamic> json) =>
      PetServicesModel(
        petServices: PetServices.fromJson(json["petServices"]),
      );

  Map<String, dynamic> toJson() => {
        "petServices": petServices.toJson(),
      };
}

const x = 1.0;
const y = 1.0;
Location initialLocation = Location(lat: 0.0, long: 0.0);
List<Review> initialReviews = [];
List<Service> initialService = [Service(servicePic: "", serviceName: "")];

List<Product> initialProducts = [
  Product(price: 1.0, productName: "", productPic: "")
];

class PetServices {
  PetServices({
    this.id = "",
    this.email = "",
    this.name = "",
    this.services,
    this.serviceName = "",
    this.location,
    this.reviews,
    this.like = const [""],
    this.dislike = const [""],
    this.phone = "",
    this.address = "",
    this.picture =
        "https://firebasestorage.googleapis.com/v0/b/pet-care-29230.appspot.com/o/pet.jpg?alt=media&token=47f7072a-e0f7-4807-aaa1-6f68b364d1ab",
    this.products,
    this.rate = 0.0,
    this.price = 0,
    this.yearsOfExp,
  });

  String id;
  String email;
  String name;
  double rate;
  int yearsOfExp;
  int price;
  List<Service> services;
  String serviceName;
  Location location;
  List<Review> reviews;
  List<String> like;
  List<String> dislike;
  String phone;
  String address;
  String picture;
  List<Product> products;

  factory PetServices.fromJson(Map<dynamic, dynamic> json) => PetServices(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        rate: json['rate'].toDouble(),
        price: json['price'],
        yearsOfExp: json['yearsOfExp'],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        serviceName: json["serviceName"],
        location: Location.fromJson(json["Location"]),
        reviews: List<Review>.from((json['reviews'] ?? Map())
            .values
            .map((review) => Review.fromJson(review))
            .toList()),
        like: List<String>.from(json["like"].map((x) => x)),
        dislike: List<String>.from(json["dislike"].map((x) => x)),
        phone: json["phone"],
        address: json["address"],
        picture: json["picture"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        'rate': rate,
        'price': price,
        'yearsOfExp': yearsOfExp,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "serviceName": serviceName,
        "Location":
            (location != null) ? location.toJson() : initialLocation.toJson(),
        "reviews": (reviews != null)
            ? List<dynamic>.from(reviews.map((x) => x.toJson()))
            : List<dynamic>.from(initialReviews.map((x) => x.toJson())),
        "like": List<dynamic>.from(like.map((x) => x)),
        "dislike": List<dynamic>.from(dislike.map((x) => x)),
        "phone": phone,
        "address": address,
        "picture": picture,
        "products": (products != null)
            ? List<dynamic>.from(products.map((x) => x.toJson()))
            : List<dynamic>.from(initialProducts.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object other) =>
      other is PetServices && other.id == id && other.name == name;
}

class Location {
  Location({
    this.lat = 1.0,
    this.long = 1.0,
  });

  double lat;
  double long;

  factory Location.fromJson(Map<dynamic, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class Product {
  Product({
    this.productName,
    this.price = 0.0,
    this.productPic,
  });

  String productName;
  double price;
  String productPic;

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        productName: json["productName"],
        price: json["price"].toDouble(),
        productPic: json["productPic"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "price": price,
        "productPic": productPic,
      };
}

class Service {
  Service({this.serviceName, this.servicePic, this.price});

  String serviceName;
  String servicePic;
  int price;

  factory Service.fromJson(Map<dynamic, dynamic> json) => Service(
        serviceName: json["serviceName"],
        servicePic: json["servicePic"],
        price: json["price"].toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "serviceName": serviceName,
        "servicePic": servicePic,
        "price": price,
      };
}

class Review {
  Review({
    this.id,
    this.review,
    this.rate,
    this.userName,
    this.userImg,
  });

  String id;
  String review;
  num rate;
  String userName;
  String userImg;

  factory Review.fromJson(Map<dynamic, dynamic> json) => Review(
      id: json["id"],
      review: json["review"],
      rate: json['rate'],
      userName: json["userName"],
      userImg: json['userImg']);

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "review": review,
        'rate': rate,
        'userName': userName,
        'userImg': userImg,
      };
}
