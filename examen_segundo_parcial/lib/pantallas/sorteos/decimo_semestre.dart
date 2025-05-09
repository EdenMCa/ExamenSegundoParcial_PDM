import 'package:flutter/material.dart';
import 'dart:math';
import 'package:examen_segundo_parcial/modelos/alumnos.dart';

class DecimoSemestre extends StatefulWidget {
  const DecimoSemestre({super.key});

  @override
  State<DecimoSemestre> createState() => _DecimoSemestreState();
}

class _DecimoSemestreState extends State<DecimoSemestre> {
  late List<String> alumnos;
  String _ganador = '';
  var _rutaImagen = 'assets/images/decimo_semestre/decimo_1.jpeg';
  bool _estaAnimado = false;

  @override
  void initState() {
    super.initState();
    alumnos = DatosAlumnos.obtenerAlumnos(2); // Semestre 2
    _cargarImagenesSemestre();
  }

  void _cargarImagenesSemestre() {
    // Puedes cargar aquí imágenes específicas para segundo semestre
    _rutaImagen = 'assets/images/decimo_semestre/decimo_1.jpeg';
  }

  Future<void> _realizarSorteo() async {
    if (!_estaAnimado) {
      _estaAnimado = true;

      // Animación con imágenes específicas de segundo semestre
      final imagenes = [
        'assets/images/decimo_semestre/decimo_1.jpeg',
        'assets/images/decimo_semestre/decimo_2.jpeg'
      ];

      for (var i = 0; i < 10; i++) {
        setState(() {
          _rutaImagen = imagenes[Random().nextInt(imagenes.length)];
        });
        await Future.delayed(const Duration(milliseconds: 200));
      }

      setState(() {
        _ganador = alumnos[Random().nextInt(alumnos.length)];
        _estaAnimado = false;
      });
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
