
import 'package:firebase_database/firebase_database.dart';

class Product {
  String _id;
  String _name;
  String _codebar;
  String _description;
  String _price;
  String _stock;
  String _date;

  Product(
    this._id,
    this._name,
    this._codebar,
    this._description,
    this._price,
    this._stock,
    this._date);

  Product.map(dynamic obj){
    _name = obj['name'];
    _codebar = obj['codebar'];
    _description = obj['description'];
    _price = obj['price'];
    _stock = obj['stock'];
    _date = obj['date'];
  }

  String get id => _id;
  String get name => _name;
  String get codebar => _codebar;
  String get description => _description;
  String get price => _price;
  String get stock => _stock;
  String get date => _date;
  

  Product.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _codebar = snapshot.value['codebar'];
    _description = snapshot.value['description'];
    _price = snapshot.value['price'];
    _stock = snapshot.value['stock'];
    _date = snapshot.value['date'];
  }
}