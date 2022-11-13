import 'dart:convert';

//decode dishes stored on json to object
List<Dishes> dishesfromJson(String str) {
  return List<Dishes>.from(json.decode(str).map((x) => Dishes.fromJson(x)));
}

String DishedToJson(List<Dishes> dishes) {
  return json.encode(
      List<dynamic>.from(dishes.map((dish) => dish.toJson()).toList())
          .toString());
}

class Dishes {
  late String dishID;
  late String name;
  late double price;
  late int quantity;
  late String type; //type: beverage, food, dessert,main course
  late String timeSlot; //day or night
  late bool special; //special dish or not
  Dishes({
    required this.dishID,
    required this.name,
    required this.price,
    required this.quantity,
    this.type = "basic",
    this.timeSlot = "day",
    this.special = false,
  });

  //creational design pattern which provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created
  factory Dishes.fromJson(Map<String, dynamic> jsonData) {
    return Dishes(
      dishID: jsonData['dishID'],
      name: jsonData['name'],
      price: double.tryParse(jsonData['name']) ?? 0,
      quantity: int.tryParse(jsonData['quantity']) ?? 0,
      timeSlot: jsonData['timeSlot'],
      special: int.tryParse(jsonData['special']) == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() => {
        "dishID": dishID,
        "name": name,
        "price": price,
        "quantity": quantity,
        "type": type,
        "timeSlot": timeSlot,
        "special": special,
      };
}
