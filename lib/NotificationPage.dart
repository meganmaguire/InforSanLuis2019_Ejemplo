import 'package:flutter/material.dart';

// Página de notificaciones.
class NotificationPage extends StatefulWidget{

	@override
	State<StatefulWidget> createState() => NotificationPageState();
}

// State asociado a la Página de notificaciones.
class NotificationPageState extends State<NotificationPage>{

	// TODO: Implementar esta pantalla para mostrar notificaciones.
	@override
	Widget build(BuildContext context) {

		return Center(
			child: Text("Notifications", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
		);
	}
}