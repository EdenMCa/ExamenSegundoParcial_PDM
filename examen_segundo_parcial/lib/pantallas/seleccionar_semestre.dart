import 'package:flutter/material.dart';
import 'package:examen_segundo_parcial/pantallas/pantalla_sorteo.dart';

class SeleccionSemestre extends StatelessWidget {
  const SeleccionSemestre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona Semestre'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [2, 4, 6, 8, 10]
              .map((semestre) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PantallaSorteo(
                            semestre: semestre,
                          ),
                        ),
                      ),
                      child: Text('$semestre° Semestre'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}