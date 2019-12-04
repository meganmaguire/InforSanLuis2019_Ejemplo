import 'package:flutter/material.dart';
import 'MyWidgets.dart';
import 'main.dart';

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
			name: "Camisa Cuadritos Rojos",
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
				gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount, crossAxisSpacing: 4, mainAxisSpacing: 4, childAspectRatio: 0.7),
				padding: EdgeInsets.all(8),
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