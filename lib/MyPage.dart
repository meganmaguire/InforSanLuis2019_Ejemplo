import 'package:flutter/material.dart';

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