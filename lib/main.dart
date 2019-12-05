import 'package:flutter/material.dart';
import 'MyApp.dart';

int gridCount = 2;

// La propuesta para este ejemplo de aplicación es que implementen alguna de las
// pantallas que han quedado sin hacer. En la pestaña inferior de "TO-DO" se
// tiene la lista de código a modificar para cada una de las pantallas. Elijan
// alguna que sea de su interés y desarróllenla.

// El proyecto está estructurado en clases por cada una de las pantallas posibles
// sumado a una clase para el Widget que se diseñó para mostrar los artículos.

// Ante cualquier duda no duden en escribirme.

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
