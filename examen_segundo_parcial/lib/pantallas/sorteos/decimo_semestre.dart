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
      var duracion = const Duration(milliseconds: 100);

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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Sorteo 10° Semestre'),
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
