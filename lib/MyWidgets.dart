import 'package:flutter/material.dart';
import 'main.dart';

// Widget personalizado para mostrar una imagen, nombre y marca de los diferentes
// productos que se encuentren en la página.
class ProductCard extends StatefulWidget {

	// Atributos del Widget necesarios para dibujarlo.
	final String imageURL;
	final String name;
	final String brand;
	bool favorited;

	ProductCard({@required this.imageURL, @required this.name, @required this.brand, this.favorited = false});

	@override
	State<StatefulWidget> createState() => ProductCardState();

}

class ProductCardState extends State<ProductCard>{
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
						child: Container(
							height: (MediaQuery.of(context).size.width-24)/gridCount,
							child: Image(
								image: NetworkImage(widget.imageURL),
								fit: BoxFit.cover,
							),
						),
					),
					Container(
						padding: EdgeInsets.only(top: 12, right: 8, left: 8, bottom: 4),
						child: Text(widget.name,
							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
							overflow: TextOverflow.ellipsis,
						),
					),
					Row(
						crossAxisAlignment: CrossAxisAlignment.start,
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Expanded(
								child: Container(
									padding: EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 12),
									child: Text(widget.brand,
										style: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.7),),
										overflow: TextOverflow.ellipsis,
									),
								),
							),
							Align(
								alignment: Alignment.bottomRight,
								child: Container(
									height: 30,
									child: IconButton(
										icon: widget.favorited ? favoritedIcon() : unfavoritedIcon(),
										onPressed:() {
											setState(() => widget.favorited = widget.favorited ? false : true);
										},
									),
								),
							)
						],
					)

				],
			),
		);
	}

	favoritedIcon(){
		return  Icon(Icons.favorite, color: Colors.pink, size: 22,);
	}

	unfavoritedIcon(){
		return  Icon(Icons.favorite_border, color: Colors.pink, size: 22,);
	}

}
