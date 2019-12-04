import 'package:flutter/material.dart';


// Carrito de compras
class ShoppingCart extends StatefulWidget{

	@override
	State<StatefulWidget> createState() => ShoppingCartState();
}

// State asociado al Carrito de compras
class ShoppingCartState extends State<ShoppingCart>{

	// TODO: Implementar esta pantalla para mostrar un carrito de compras.
	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text("Carrito de Compras"),
			),
			body: Center(
				child: Text("Carrito", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
			),
		);
	}
}