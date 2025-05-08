import 'package:flutter/material.dart';
import 'package:examen_segundo_parcial/pantallas/seleccionar_semestre.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteo de Alumnos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido al sistema de sorteos',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SeleccionSemestre(),
                ),
              ),
              child: const Text('Iniciar Sorteo'),
            ),
          ],
        ),
      ),
    );
  }
}