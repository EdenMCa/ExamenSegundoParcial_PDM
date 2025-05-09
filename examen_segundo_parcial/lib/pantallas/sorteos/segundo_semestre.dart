import 'package:flutter/material.dart';
import 'dart:math';
import 'package:examen_segundo_parcial/modelos/alumnos.dart';

class SegundoSemestre extends StatefulWidget {
  const SegundoSemestre({super.key});

  @override
  State<SegundoSemestre> createState() => _SegundoSemestreState();
}

class _SegundoSemestreState extends State<SegundoSemestre> {
  late List<String> alumnos;
  String _ganador = '';
  var _rutaImagen = 'assets/images/segundo_semestre/default.jpg';
  bool _estaAnimado = false;

  @override
  void initState() {
    super.initState();
    alumnos = DatosAlumnos.obtenerAlumnos(2); // Semestre 2
    _cargarImagenesSemestre();
  }

  void _cargarImagenesSemestre() {
    // Puedes cargar aquí imágenes específicas para segundo semestre
    _rutaImagen = 'assets/images/segundo_semestre/imagen1.jpg';
  }

  Future<void> _realizarSorteo() async {
    if (!_estaAnimado) {
      _estaAnimado = true;
      
      // Animación con imágenes específicas de segundo semestre
      final imagenes = [
        'assets/images/segundo_semestre/imagen1.jpg',
        'assets/images/segundo_semestre/imagen2.jpg',
        'assets/images/segundo_semestre/imagen3.jpg',
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
        title: const Text('Sorteo 2° Semestre'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green], // Gradiente diferente para 2° semestre
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
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
                _ganador.isEmpty ? 'Presiona el botón para sortear' : 'Ganador: $_ganador',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _realizarSorteo,
                icon: const Icon(Icons.refresh),
                label: const Text('Realizar Sorteo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Color diferente para 2° semestre
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}