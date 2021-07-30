
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//nuevo para imagenes
import 'dart:io';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:inventorystar/models/product.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:inventorystar/providers/ui_provider.dart';
import 'package:inventorystar/src/camera_button_tab1.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatefulWidget {
  final Product product;
  ProductScreen(this.product);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ProductScreenState extends State<ProductScreen> {

  List<Product> items;

  TextEditingController _nameController;
  TextEditingController _codebarController;
  TextEditingController _descriptionController;
  TextEditingController _priceController;
  TextEditingController _stockController;
  TextEditingController _dateController;


  //fin nuevo imagen

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = new TextEditingController(text: widget.product.name);
    _codebarController = new TextEditingController(text: widget.product.codebar);
    _descriptionController = new TextEditingController(text: widget.product.description);
    _priceController = new TextEditingController(text: widget.product.price);
    _stockController = new TextEditingController(text: widget.product.stock);
    _dateController = new TextEditingController(text: widget.product.date);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Producto'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
       
        //height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(),
                TextField(
                  controller: _nameController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _codebarController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.qr_code), labelText: 'Codigo'),
                      
                ),
                CameraButtonTab1(),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _descriptionController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Descripcion'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _priceController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on), labelText: 'Precio'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _stockController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.shop), labelText: 'Existencia'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _dateController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.date_range), labelText: 'Fecha'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      //nuevo imagen
                      if (widget.product.id != null) {
 
                        productReference.child(widget.product.id).set({
                          'name': _nameController.text,
                          'codebar': _codebarController.text,
                          'description': _descriptionController.text,
                          'price': _priceController.text,
                          'stock': _stockController.text,
                          'date': _dateController.text

                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {

                        productReference.push().set({
                          'name': _nameController.text,
                          'codebar': _codebarController.text,
                          'description': _descriptionController.text,
                          'price': _priceController.text,
                          'stock': _stockController.text,
                          'date': _dateController.text
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.product.id != null)
                        ? Text('Agregar')
                        : Text('Añadir')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
