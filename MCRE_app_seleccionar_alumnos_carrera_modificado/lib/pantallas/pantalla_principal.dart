import 'package:flutter/material.dart';
import 'package:examen_segundo_parcial/pantallas/seleccionar_semestre.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_alt_outlined,
              size: 200,
              color: Colors.blueGrey[600],
            ),
            const SizedBox(height: 24),
            const Text(
              'Sistema de Sorteos',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Selecciona alumnos ganadores de manera aleatoria',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey[600],
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 40),
            OutlinedButton.icon( // Se agrego el icono
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SeleccionSemestre(),
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue[600],
                side: BorderSide(color: Colors.blue[400]!),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.play_arrow), // Ícono de play para el inicio
              label: const Text(
                'Iniciar Sorteo',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
