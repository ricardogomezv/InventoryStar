import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:inventorystar/models/product.dart';


class ProductInformation extends StatefulWidget {
  final Product product;
  ProductInformation(this.product);
  @override
  _ProductInformationState createState() => _ProductInformationState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ProductInformationState extends State<ProductInformation> {

  List<Product> items;

  @override
  void initState() {   
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[                
                new Text("Producto : ${widget.product.name}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Codigo : ${widget.product.codebar}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Descripcion : ${widget.product.description}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Precio : ${widget.product.price}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Existencia : ${widget.product.stock}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Fecha : ${widget.product.date}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
