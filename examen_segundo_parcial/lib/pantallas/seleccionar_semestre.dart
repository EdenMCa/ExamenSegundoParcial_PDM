import 'package:flutter/material.dart';
import 'package:examen_segundo_parcial/pantallas/sorteos/segundo_semestre.dart';
import 'package:examen_segundo_parcial/pantallas/sorteos/cuarto_semestre.dart';
import 'package:examen_segundo_parcial/pantallas/sorteos/sexto_semestre.dart';
import 'package:examen_segundo_parcial/pantallas/sorteos/octavo_semestre.dart';
import 'package:examen_segundo_parcial/pantallas/sorteos/decimo_semestre.dart';

class SeleccionSemestre extends StatelessWidget {
  const SeleccionSemestre({super.key});

  // Mapa de semestres a sus respectivas pantallas
  final Map<int, Widget Function()> semestres = const {
    2: SegundoSemestre.new,
    // 4: CuartoSemestre.new,
    // 6: SextoSemestre.new,
    // 8: OctavoSemestre.new,
    // 10: DecimoSemestre.new,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Selección de Semestre'),
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
              Icon(
                Icons.school_outlined,
                size: 64,
                color: Colors.blueGrey[600],
              ),
              const SizedBox(height: 24),
              Text(
                'Selecciona el semestre\ndel sorteo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.blueGrey[800],
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              ...semestres.keys.map((semestre) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OutlinedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => semestres[semestre]!(),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueGrey[800],
                    side: BorderSide(color: Colors.blueGrey[300]!),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '$semestre° Semestre',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}