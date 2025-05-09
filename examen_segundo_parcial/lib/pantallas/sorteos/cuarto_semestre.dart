import 'package:flutter/material.dart';
import 'dart:math';

class CuartoSemestre extends StatefulWidget {
  const CuartoSemestre({super.key});

  @override
  State<CuartoSemestre> createState() => _CuartoSemestreState();
}

class _CuartoSemestreState extends State<CuartoSemestre> {
  late List<String> alumnos;
  String _ganador = '';
  var _i = 1;
  var _rutaImagen = 'assets/images/cuarto_semestre/cuarto_1.jpeg';
  bool _estaAnimado = false;

  final List<String> _nombreAlumnos = [
    'Alberto',
    'Héctor',
    'Yamileth',
    'Bryan',
    'Juan',
    'Rebeca',
    'Rosalinda',
    'Jennifer',
    'Patricia',
    'Galilea',
    'Addi'
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _realizarSorteo() async {
    if (!_estaAnimado) {
      _estaAnimado = true;

      // Animación con imágenes específicas de segundo semestre
      List<String> listaRutas = [
        'assets/images/cuarto_semestre/cuarto_1.jpeg',
        'assets/images/cuarto_semestre/cuarto_2.jpeg',
        'assets/images/cuarto_semestre/cuarto_3.jpeg',
        'assets/images/cuarto_semestre/cuarto_4.jpeg',
        'assets/images/cuarto_semestre/cuarto_5.jpeg',
        'assets/images/cuarto_semestre/cuarto_6.jpeg',
        'assets/images/cuarto_semestre/cuarto_7.jpeg',
        'assets/images/cuarto_semestre/cuarto_8.jpeg',
        'assets/images/cuarto_semestre/cuarto_9.jpeg',
        'assets/images/cuarto_semestre/cuarto_10.jpeg',
        'assets/images/cuarto_semestre/cuarto_11.jpeg',
      ];

      // Variable que indica cuando dura la animación de movimiento entre imágenes.
      var duracion = const Duration(milliseconds: 200);

      for (var cara in listaRutas) {
        setState(() {
          _rutaImagen = cara;
        });
        await Future.delayed(duracion);
      }

      // Aquí se realiza la lógica para mostrar la imagen aleatoria.
      setState(() {
        _i = Random().nextInt(10) +
            1; // La función Random asigna un número aleatorio a _i.
        _rutaImagen =
            'assets/images/cuarto_semestre/cuarto_$_i.jpeg'; // El número aleatorio se agrega a la ruta de la imagen y se guarda en _rutaCara.
        _ganador = _nombreAlumnos[_i-1];
      });
      _estaAnimado = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteo 4° Semestre'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
          Color.fromRGBO(255, 255, 255, 10),
          Color.fromRGBO(224, 224, 180, 0.965)
        ], radius: 0.4)),
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
              const SizedBox(height: 20),
              Text(
                _ganador.isEmpty
                    ? 'Presiona el botón para sortear'
                    : 'Ganador: $_ganador',
                style: const TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _realizarSorteo,
                icon: const Icon(Icons.refresh),
                label: const Text('Realizar Sorteo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Color diferente para 2° semestre
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
