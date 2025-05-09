import 'package:flutter/material.dart';
import 'dart:math';

class SegundoSemestre extends StatefulWidget {
  const SegundoSemestre({super.key});

  @override
  State<SegundoSemestre> createState() => _SegundoSemestreState();
}

class _SegundoSemestreState extends State<SegundoSemestre> {
  late List<String> alumnos;
  String _ganador = '';
  var _i = 1;
  var _rutaImagen = 'assets/images/segundo_semestre/segundo_19.jpeg';
  bool _estaAnimado = false;


  final List<String> _nombreAlumnos = [
    'Alexander',
    'Lizbeth',
    'Lidia',
    'Monteerrat',
    'Iris',
    'Ana',
    'Jairo',
    'Alexis',
    'Miguel',
    'Armando',
    'Aldo',
    'Luis',
    'Angel',
    'Jaziel',
    'Kevin',
    'Roberto',
    'Uiviano',
    'Mikal',
    'Ailed'
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
        'assets/images/segundo_semestre/segundo_1.jpeg',
        'assets/images/segundo_semestre/segundo_2.jpeg',
        'assets/images/segundo_semestre/segundo_3.jpeg',
        'assets/images/segundo_semestre/segundo_4.jpeg',
        'assets/images/segundo_semestre/segundo_5.jpeg',
        'assets/images/segundo_semestre/segundo_6.jpeg',
        'assets/images/segundo_semestre/segundo_7.jpeg',
        'assets/images/segundo_semestre/segundo_8.jpeg',
        'assets/images/segundo_semestre/segundo_9.jpeg',
        'assets/images/segundo_semestre/segundo_10.jpeg',
        'assets/images/segundo_semestre/segundo_11.jpeg',
        'assets/images/segundo_semestre/segundo_12.jpeg',
        'assets/images/segundo_semestre/segundo_13.jpeg',
        'assets/images/segundo_semestre/segundo_14.jpeg',
        'assets/images/segundo_semestre/segundo_15.jpeg',
        'assets/images/segundo_semestre/segundo_16.jpeg',
        'assets/images/segundo_semestre/segundo_17.jpeg',
        'assets/images/segundo_semestre/segundo_18.jpeg',
        'assets/images/segundo_semestre/segundo_19.jpeg',
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
        _i = Random().nextInt(18)+
            1; // La función Random asigna un número aleatorio a _i.
        _rutaImagen =
            'assets/images/segundo_semestre/segundo_$_i.jpeg'; // El número aleatorio se agrega a la ruta de la imagen y se guarda en _rutaCara.
        _ganador = _nombreAlumnos[_i-1];
      });
      _estaAnimado = false;
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
