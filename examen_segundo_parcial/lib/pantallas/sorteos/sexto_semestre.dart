import 'package:flutter/material.dart';
import 'dart:math';

class SextoSemestre extends StatefulWidget {
  const SextoSemestre({super.key});

  @override
  State<SextoSemestre> createState() => _SextoSemestreState();
}

class _SextoSemestreState extends State<SextoSemestre> {
  late List<String> alumnos;
  var _i = 1;
  String _ganador = '';
  var _rutaImagen = 'assets/images/sextoSemestre/compa_1.jpeg';
  bool _estaAnimado = false;

  // Lista de nombres de alumnos 
  final List<String> _nombresAlumnos = [
    'Albert',
    'Kevin',
    'Elton',
    'Diana',
    'Eden',
    'Amelia',
    'Sergio' 
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _realizarSorteo() async {
    if (!_estaAnimado) {
      _estaAnimado = true;

  List<String> listaRutas = [
        'assets/images/sextoSemestre/compa_1.jpeg',
        'assets/images/sextoSemestre/compa_2.jpeg',
        'assets/images/sextoSemestre/compa_3.jpeg',
        'assets/images/sextoSemestre/compa_4.jpeg',
        'assets/images/sextoSemestre/compa_5.jpeg',
        'assets/images/sextoSemestre/compa_6.jpeg',
        'assets/images/sextoSemestre/compa_7.jpeg'        
      ];

      var duracion = const Duration(milliseconds: 100);

      for (var cara in listaRutas) {
        setState(() {
          _rutaImagen = cara;
        });
        await Future.delayed(duracion);
      }

      // Aquí se realiza la lógica para mostrar la imagen aleatoria.
      setState(() {
        _i = Random().nextInt(7) +
            1; // La función Random asigna un número aleatorio a _i.
        _rutaImagen =
            'assets/images/sextoSemestre/compa_$_i.jpeg'; // El número aleatorio se agrega a la ruta de la imagen y se guarda en _rutaCara.
        _ganador = _nombresAlumnos[_i-1];
      });
      _estaAnimado = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Sorteo 6° Semestre'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  _rutaImagen,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _ganador.isEmpty
                    ? 'Presiona el botón para sortear'
                    : 'Ganador: $_ganador',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: _ganador.isEmpty
                      ? FontWeight.w300
                      : FontWeight.bold,
                  color: Colors.blueGrey[800],
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200, // Ancho personalizado del botón
                child: OutlinedButton.icon(
                  onPressed: _realizarSorteo,
                  icon: const Icon(Icons.autorenew),
                  label: const Text('Realizar Sorteo'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueGrey[800],
                    side: BorderSide(color: Colors.blueGrey[300]!),
                    minimumSize: const Size(200, 56), // Tamaño mínimo ajustado
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
