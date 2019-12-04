import 'package:flutter/material.dart';
import 'MyApp.dart';

int gridCount = 2;

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
