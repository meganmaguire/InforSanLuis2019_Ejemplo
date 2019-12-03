import 'package:flutter/material.dart';

void main() => runApp(

	// Esta es la aplicación principal.
	MaterialApp(
		title: 'Flutter Demo',
		theme: ThemeData(

			primaryColor: Color.fromRGBO(244, 240, 204,1),
			scaffoldBackgroundColor: Color.fromRGBO(255, 254, 250,1),
			iconTheme: IconThemeData(color: Color.fromRGBO(51, 51, 51, 1), ),
		),
		home: MyApp(),
	)
);

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
	final pages = [
		FavoritePage(),
		SearchPage(),
		MyPage(),
		NotificationsPage()
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
				body: pages[selectedPage],
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

// Página de búsqueda.
class SearchPage extends StatefulWidget{

	// Lista de productos ya armados para mostrar en la Página de búsqueda.
	List<ProductCard> products = [
		ProductCard(
			imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_TnFjuTfbk5VdAEVJiGzmjTSn3Khj-qoidPcdgG_pC5hnaIRv",
			name: "Camisa",
			brand: "Marca X",
		),

		ProductCard(
			imageURL: "https://www.dhresource.com/600x600/f2/albu/g7/M00/D2/39/rBVaSltSjzCAAoTvAAGgorRCpx4542.jpg",
			name: "Camisa Flores",
			brand: "Marca Y",
		),

		ProductCard(
			imageURL: "https://m.media-amazon.com/images/I/71GmFqZnVsL._SR500,500_.jpg",
			name: "Camisa Cuadritos",
			brand: "Marca Z",
		),

		ProductCard(
			imageURL: "http://www.limpiezasmayca.es/images/cate_11/640/Mferlier-mujeres-algod%C3%B3n-Blusas-de-lino-colorido-manga-larga-camisa-mujeres-Stand-collar-Blusas-Mujer-Plus-Size-camisas-femeninas-Xw2En4T-syl0.jpg",
			name: "Camisa Colores",
			brand: "Marca X",
		),

		ProductCard(
			imageURL: "http://www.tricotsdemamen.es/images/cate_18/640/Excelente-2018-mujeres-coreanas-Casual-Kimono-camisa-blusa-Hippie-Boho-Mori-chica-bordado-camisas-femeninas-Blusas-Mujer-se%C3%B1ora-Tops-oto%C3%B1o-Zy4Bu7Tg3Bi0-evn0.jpg",
			name: "Camisa Blanca",
			brand: "Marca Y",
		)
	];
	@override
  State<StatefulWidget> createState() => SearchPageState();

}
// State asociado a la Página de búsqueda.
class SearchPageState extends State<SearchPage>{

	@override
  Widget build(BuildContext context) {

    return Container(

		// El GridView nos sirve para visualizar diferentes Widgets en forma de
		// grilla. Esta es una grilla de dos columnas que se genera en función
		// de una lista de Widgets de tipo ProductCard definida anteriormente.
		child: GridView.builder(
			gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 0.72),
			padding: EdgeInsets.all(12),
			itemCount: widget.products.length,

			// Esta propiedad recibe una función con un índice que va dibujando
			// los distintos Widgets de la lista products, uno a uno. Como lo
			// visto en el ejemplo de la ListView.
			itemBuilder: (BuildContext context, int index){
				return widget.products[index];
			},
		)
	);

  }
}

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
			child: Text("Favorites", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
		);
    }
}

// Página de Usuario.
class MyPage extends StatefulWidget{

	@override
  State<StatefulWidget> createState() => MyPageState();
}

// State asociado a la Página de Usuario.
class MyPageState extends State<MyPage>{

	// TODO: Implementar esta pantalla para mostrar información de usuario.
	@override
  Widget build(BuildContext context) {

    return Center(
		child: Text("My Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
	);
  }
}

// Página de notificaciones.
class NotificationsPage extends StatefulWidget{

	@override
  State<StatefulWidget> createState() => NotificationsPageState();
}

// State asociado a la Página de notificaciones.
class NotificationsPageState extends State<NotificationsPage>{

	// TODO: Implementar esta pantalla para mostrar notificaciones.
	@override
  Widget build(BuildContext context) {

    return Center(
		child: Text("Notifications", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
	);
  }
}

// Widget personalizado para mostrar una imagen, nombre y marca de los diferentes
// productos que se encuentren en la página.
class ProductCard extends StatelessWidget{

	// Atributos del Widget necesarios para dibujarlo.
	final String imageURL;
	final String name;
	final String brand;

	ProductCard({@required this.imageURL, @required this.name, @required this.brand});
	@override
  Widget build(BuildContext context) {

    return Card(
		shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
		elevation: 2,
		child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				// Recorta la imagen para coincidir con los bordes del Card.
				ClipRRect(
					borderRadius:  BorderRadius.vertical(top: Radius.circular(5), bottom: Radius.zero),
					child: Image(
						image: NetworkImage(imageURL),
						fit: BoxFit.cover,
					),
				),
				Container(
					padding: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 4),
					child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), ),
				),
				Container(
					padding: EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 12),
					child: Text(brand, style: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.7),),),
				)

			],
		),
	);
  }
}

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
		body: Center(
			child: Text("Notifications", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
		),
	);
  }
}