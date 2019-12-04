import 'package:flutter/material.dart';
import 'MyPage.dart';
import 'SearchPage.dart';
import 'NotificationPage.dart';
import 'FavoritePage.dart';
import 'ShoppingCart.dart';


// MyApp es la página principal de nuestra aplicación, donde vamos a mostrar
// toda la información.
class MyApp extends StatefulWidget {

	@override
	State<StatefulWidget> createState() => MyAppState();

}

// El estado de nuestra página principal MyApp
class MyAppState extends State<MyApp>{


	// Nos indica que página fue seleccionada de la bottomNavigationBar.
	int selectedPage = 0;

	// Esta lista contiene las diferentes pantallas que vamos a mostrar en el
	// body del Scaffold, dependiendo de la página seleccionada.
	var pages = [
		FavoritePage(),
		SearchPage(),
		MyPage(),
		NotificationPage()
	];

	// Lista de items de la BottomNavigationBar.
	var items = [
		BottomNavigationBarItem(
			icon: Icon(Icons.favorite, color: Color.fromRGBO(51, 51, 51, 0.5),),
			activeIcon: Icon(Icons.favorite, color: Color.fromRGBO(51, 51, 51, 1),),
			title: Text("Favorites", style: TextStyle(fontSize: 12),),
			backgroundColor: Color.fromRGBO(244, 240, 204,1),
		),
		BottomNavigationBarItem(
			icon: Icon(Icons.search, color: Color.fromRGBO(51, 51, 51, 0.5),),
			activeIcon: Icon(Icons.search, color: Color.fromRGBO(51, 51, 51, 1),),
			title: Text("Search", style: TextStyle(fontSize: 12)),
			backgroundColor: Color.fromRGBO(244, 240, 204,1),
		),
		BottomNavigationBarItem(
			icon: Icon(Icons.person, color: Color.fromRGBO(51, 51, 51, 0.5),),
			activeIcon: Icon(Icons.person, color: Color.fromRGBO(51, 51, 51, 1),),
			title: Text("My page", style: TextStyle(fontSize: 12),),
			backgroundColor: Color.fromRGBO(244, 240, 204,1),
		),
		BottomNavigationBarItem(
			icon: Icon(Icons.notifications, color: Color.fromRGBO(51, 51, 51, 0.5),),
			activeIcon: Icon(Icons.notifications, color: Color.fromRGBO(51, 51, 51, 0.5),),
			title: Text("Notifications", style: TextStyle(fontSize: 12),),
			backgroundColor: Color.fromRGBO(244, 240, 204,1),
		)

	];

	// Definición del build de nuestra página principal MyApp
	@override
	Widget build(BuildContext context) {
		return  Scaffold(
			appBar: AppBar(
				title: Text("Mishka"),
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.shopping_cart, color: Color.fromRGBO(51, 51, 51, 1),),
						onPressed: (){
							// Uso del Navigator para cambiar de pantalla al
							// carrito de compras.
							Navigator.of(context).push(MaterialPageRoute(builder: (context){
								return ShoppingCart();
							}));
						},
					)
				],
			),
			drawer: Drawer(
				child: ListView(
					children: <Widget>[
						Text("Drawer")
					],
				),
			),
			// Se dibuja una página diferente en función de lo seleccionado
			body: SafeArea(
				top: false,
				child: IndexedStack(
					index: selectedPage,
					children: pages,
				),
			),
			bottomNavigationBar: BottomNavigationBar(
				items: items,
				currentIndex: selectedPage,
				iconSize: 24,
				selectedItemColor: Color.fromRGBO(51, 51, 51, 1),
				unselectedItemColor: Color.fromRGBO(51, 51, 51, 0.5),
				onTap: (int index){
					// Uso del setState para redibujar el Widget.
					setState(() => selectedPage = index );
				},
				backgroundColor: Color.fromRGBO(244, 240, 204,1),
				type: BottomNavigationBarType.fixed,

			),
		);
	}
}






