import 'package:dart_application_1/enum/tipo_ficha.dart';

class Jugador {
  //Atributos
  String nombres;
  String apellidos;
  int identificacion;
  Map<TipoFicha, int> fichasDisponibles;
  int saldoEfectivo;

  //Constructor
  Jugador({
    required this.nombres,
    required this.apellidos,
    required this.identificacion,
    required this.fichasDisponibles,
    required this.saldoEfectivo,
  });

  //Metodos
}
