import 'package:flutter/material.dart';
import 'dart:math';

class OctavoSemestre extends StatefulWidget {
  const OctavoSemestre({super.key});

  @override
  State<OctavoSemestre> createState() => _OctavoSemestreState();
}

class _OctavoSemestreState extends State<OctavoSemestre> {
  late List<String> alumnos;
  String _ganador = '';
  var _i = 1;
  var _rutaImagen = 'assets/images/octavoSemestre/octavo_1.jpg';
  bool _estaAnimado = false;

  // Lista de nombres de alumnos 
  final List<String> _nombresAlumnos = [
    'Nayeli',
    'Efren',
    'David',
    'Ramiro',
    'Luis',
    'Yenis',
    'Gabriela' 
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _realizarSorteo() async {
    if (!_estaAnimado) {
      _estaAnimado = true;

  List<String> listaRutas = [
        'assets/images/octavoSemestre/octavo_1.jpg',
        'assets/images/octavoSemestre/octavo_2.jpg',
        'assets/images/octavoSemestre/octavo_3.jpg',
        'assets/images/octavoSemestre/octavo_4.jpg',
        'assets/images/octavoSemestre/octavo_5.jpg',
        'assets/images/octavoSemestre/octavo_6.jpg',
        'assets/images/octavoSemestre/octavo_7.jpg'
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
            'assets/images/octavoSemestre/octavo_$_i.jpg'; // El número aleatorio se agrega a la ruta de la imagen y se guarda en _rutaCara.
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
        title: const Text('Sorteo 8° Semestre'),
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
                width: 200, 
                child: OutlinedButton.icon(
                  onPressed: _realizarSorteo,
                  icon: const Icon(Icons.autorenew),
                  label: const Text('Realizar Sorteo'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueGrey[800],
                    side: BorderSide(color: Colors.blueGrey[300]!),
                    minimumSize: const Size(200, 56), 
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
