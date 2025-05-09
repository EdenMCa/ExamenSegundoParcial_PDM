import 'package:flutter/material.dart';
import 'dart:math';

class DecimoSemestre extends StatefulWidget {
  const DecimoSemestre({super.key});

  @override
  State<DecimoSemestre> createState() => _DecimoSemestreState();
}

class _DecimoSemestreState extends State<DecimoSemestre> {
  late List<String> alumnos;
  String _ganador = '';
  var _i = 1;
  var _rutaImagen = 'assets/images/decimo_semestre/decimo_1.jpeg';
  bool _estaAnimado = false;

  final List<String> _nombreAlumnos = [
    'Alba',
    'Adair',
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _realizarSorteo() async {
    if (!_estaAnimado) {
      _estaAnimado = true;

      List<String> listaRutas = [
        'assets/images/decimo_semestre/decimo_1.jpeg',
        'assets/images/decimo_semestre/decimo_2.jpeg',
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
        _i = Random().nextInt(2) + 1; // La función Random asigna un número aleatorio a _i.
        _rutaImagen = 'assets/images/decimo_semestre/decimo_$_i.jpeg'; // El número aleatorio se agrega a la ruta de la imagen y se guarda en _rutaCara.
        _ganador = _nombreAlumnos[_i-1];
      });
      _estaAnimado = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteo 10° Semestre'),
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
                style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
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