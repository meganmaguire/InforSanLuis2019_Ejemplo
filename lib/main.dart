import 'package:flutter/material.dart';

void main() => runApp(
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

class MyApp extends StatefulWidget {

	@override
	State<StatefulWidget> createState() => MyAppState();

}
class MyAppState extends State<MyApp>{

	int selectedPage = 0;
	final pages = [
		FavoritePage(),
		SearchPage(),
		MyPage(),
		NotificationsPage()
	];

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

	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return  Scaffold(
				appBar: AppBar(

					title: Text("Mishka"),
					actions: <Widget>[
						IconButton(
							icon: Icon(Icons.shopping_cart, color: Color.fromRGBO(51, 51, 51, 1),),
							onPressed: (){
								//NAVEGACION
								Navigator.of(context).push(MaterialPageRoute(builder: (context){
									return ShoppingCart();
								}));
							},
						)
					],
				),
				drawer: Drawer(child: ListView(children: <Widget>[Text("Drawer")],),),
				body: pages[selectedPage],
				bottomNavigationBar: BottomNavigationBar(
					items: items,
					currentIndex: selectedPage,
					iconSize: 24,
					selectedItemColor: Color.fromRGBO(51, 51, 51, 1),
					unselectedItemColor: Color.fromRGBO(51, 51, 51, 0.5),
					onTap: (int index){ setState(() => selectedPage = index );},
					backgroundColor: Color.fromRGBO(244, 240, 204,1),
					type: BottomNavigationBarType.fixed,

				),
		);
	}
}

class SearchPage extends StatefulWidget{

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

class SearchPageState extends State<SearchPage>{

	@override
  Widget build(BuildContext context) {
    return Container(
		child: GridView.builder(
			gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 0.72),
			padding: EdgeInsets.all(12),
			itemCount: widget.products.length,
			itemBuilder: (BuildContext context, int index){
				return widget.products[index];
			},
		)
	);

  }
}


class FavoritePage extends StatefulWidget{

	@override
  State<StatefulWidget> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage>{

	@override
    Widget build(BuildContext context) {
		return Center(
			child: Text("Favorites", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
		);
    }
}


class MyPage extends StatefulWidget{

	@override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<MyPage>{

	@override
  Widget build(BuildContext context) {

    return Center(
		child: Text("My Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
	);
  }
}


class NotificationsPage extends StatefulWidget{

	@override
  State<StatefulWidget> createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage>{

	@override
  Widget build(BuildContext context) {

    return Center(
		child: Text("Notifications", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
	);
  }
}


class ProductCard extends StatelessWidget{
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

class ShoppingCart extends StatefulWidget{

	@override
  State<StatefulWidget> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart>{

	@override
  Widget build(BuildContext context) {

    return Scaffold(
		body: Center(
			child: Text("Notifications", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
		),
	);
  }
}