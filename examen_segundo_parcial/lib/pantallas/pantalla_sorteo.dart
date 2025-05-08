import 'package:flutter/material.dart';
import 'dart:math';
import 'package:examen_segundo_parcial/modelos/alumnos.dart';

class PantallaSorteo extends StatefulWidget {
  final int semestre;

  const PantallaSorteo({super.key, required this.semestre});

  @override
  State<PantallaSorteo> createState() => _PantallaSorteoState();
}

class _PantallaSorteoState extends State<PantallaSorteo> {
  late List<String> alumnos;
  String _ganador = '';
  var _rutaImagen = 'assets/images/compa_1.jpeg';
  bool _estaAnimado = false;

  @override
  void initState() {
    super.initState();
    // Cargar alumnos al iniciar la pantalla
    alumnos = DatosAlumnos.obtenerAlumnos(widget.semestre);
  }

  Future<void> _realizarSorteo() async {
    if (!_estaAnimado && alumnos.isNotEmpty) {
      _estaAnimado = true;
      
      // Animación de imágenes
      final imagenes = List.generate(7, (i) => 'assets/images/compa_${i + 1}.jpeg');
      for (var imagen in imagenes) {
        setState(() => _rutaImagen = imagen);
        await Future.delayed(const Duration(milliseconds: 200));
      }

      // Selección del ganador
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
        title: Text('Sorteo ${widget.semestre}° Semestre'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.red, Colors.blue],
            radius: 1.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_rutaImagen, width: 250),
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
                  backgroundColor: Colors.blue,
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