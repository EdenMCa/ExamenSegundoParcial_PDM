// Datos de alumnos por semestre
class DatosAlumnos {
  static final Map<int, List<String>> alumnosPorSemestre = {
    2: ['Albert', 'Kevin', 'Elton','Diana', 'Eden', 'Amelia','Elias'],
    4: ['Carlos Ruiz', 'Sofía Mendoza', 'Diego González'],
    6: ['Pedro Ramírez', 'Laura Castro', 'Miguel Torres'],
    8: ['Elena Díaz', 'Fernando Ortega', 'Silvia Vargas'],
    10: ['Roberto López', 'María Martínez', 'Adriana Ruiz'],
  };

  // Método para obtener alumnos por semestre
  static List<String> obtenerAlumnos(int semestre) {
    return alumnosPorSemestre[semestre] ?? [];
  }
}