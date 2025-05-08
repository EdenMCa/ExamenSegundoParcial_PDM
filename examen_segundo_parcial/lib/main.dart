import 'package:flutter/material.dart';
import 'package:examen_segundo_parcial/pantallas/pantalla_principal.dart';

void main() => runApp(const MyApp());
                                                                                                                                                                                                                                                                                                                                                       
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteo Alumnos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PantallaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}