import 'package:flutter/material.dart';
import 'dart:math';
import 'package:examen_segundo_parcial/pantallas/pantalla_principal.dart';


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
    'Ailed',
    'Lizbeth',
    'Lidia',
    'Monserrat',
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
    'Viviana',
    'Mikal',
    'Alexander'
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          '2° Semestre (203)',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0, 
          ),
        ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  ),
                  const SizedBox(height: 20), 

                  SizedBox(
                    width: 200,
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PantallaPrincipal()),
                        (route) => false,
                      ),
                      icon: const Icon(Icons.home_outlined),
                      label: const Text('Home'),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}