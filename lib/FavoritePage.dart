import 'package:flutter/material.dart';


// Página de Favoritos.
class FavoritePage extends StatefulWidget{

	@override
	State<StatefulWidget> createState() => FavoritePageState();
}

// State asociado a la Página de Favoritos.
class FavoritePageState extends State<FavoritePage>{

	// TODO: Implementar esta pantalla para mostrar favoritos.
	@override
	Widget build(BuildContext context) {

		return Center(
			child: Text("Favorites", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
		);
	}
}
