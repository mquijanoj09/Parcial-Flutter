import 'dart:math';
import 'package:dart_application_1/enum/tipo_ficha.dart';
import 'package:dart_application_1/model/jugador.dart';

class Repartidor {
  //Atributos
  String nombres;
  String apellidos;
  int identificacion;
  int saldoEfectivo;
  Map<TipoFicha, int> fichasDisponibles;

  //Constructor
  Repartidor({
    required this.nombres,
    required this.apellidos,
    required this.identificacion,
    required this.saldoEfectivo,
    required this.fichasDisponibles,
  });

  //Metodo para lanzar un nuevo juego
  void lanzarNuevoJuego(
    Jugador jugador,
    String caraOcruz,
  ) {
    final random = Random();
    List<String> resultados = ['cara', 'cruz'];
    String resultado = resultados[random.nextInt(2)];
    int comision = ((jugador.fichasDisponibles[TipoFicha.azul]! +
                jugador.fichasDisponibles[TipoFicha.roja]! +
                jugador.fichasDisponibles[TipoFicha.dorada]!) *
            0.1)
        .toInt();

    if (resultado == caraOcruz) {
      jugador.fichasDisponibles[TipoFicha.dorada] =
          (jugador.fichasDisponibles[TipoFicha.dorada]! * 2) - comision;
      jugador.fichasDisponibles[TipoFicha.azul] =
          jugador.fichasDisponibles[TipoFicha.azul]! * 2;
      jugador.fichasDisponibles[TipoFicha.roja] =
          jugador.fichasDisponibles[TipoFicha.roja]! * 2;
      print(
          "${jugador.nombres} GANASTE, la comision fue de 10%: $comision, entonces quedaste con: ${jugador.fichasDisponibles[TipoFicha.dorada]} doradas, ${jugador.fichasDisponibles[TipoFicha.roja]} rojas y ${jugador.fichasDisponibles[TipoFicha.azul]} azules");
    } else {
      jugador.fichasDisponibles[TipoFicha.dorada] = 0;
      jugador.fichasDisponibles[TipoFicha.azul] = 0;
      jugador.fichasDisponibles[TipoFicha.roja] = 0;
      print(
          "${jugador.nombres} PERDISTE, entonces quedaste con: ${jugador.fichasDisponibles[TipoFicha.dorada]} doradas, ${jugador.fichasDisponibles[TipoFicha.roja]} rojas y ${jugador.fichasDisponibles[TipoFicha.azul]} azules");
    }
  }

  //Metodo para cambiar fichas por efectivo
  void cambioFichasPorEfectivo(int fichasDoradasCambio, int fichasRojasCambio,
      int fichasAzulesCambio, Jugador jugador) {
    //Comprobacion de que pueda
    if (jugador.fichasDisponibles[TipoFicha.azul]! >= fichasAzulesCambio &&
        jugador.fichasDisponibles[TipoFicha.dorada]! >= fichasDoradasCambio &&
        jugador.fichasDisponibles[TipoFicha.roja]! >= fichasRojasCambio) {
      int saldoDoradas = jugador.fichasDisponibles[TipoFicha.dorada]! * 100;
      int saldoRojas = jugador.fichasDisponibles[TipoFicha.roja]! * 10;
      int saldoAzules = jugador.fichasDisponibles[TipoFicha.azul]! * 25;

      jugador.saldoEfectivo =
          jugador.saldoEfectivo + saldoAzules + saldoRojas + saldoDoradas;
      print(
          "${jugador.nombres} cambiaste $fichasDoradasCambio fichas doradas (valor 100), $fichasRojasCambio fichas rojas (valor 10), $fichasAzulesCambio fichas azules (valor 25), y tu nuevo saldo es de ${jugador.saldoEfectivo}");
      jugador.fichasDisponibles[TipoFicha.dorada] =
          jugador.fichasDisponibles[TipoFicha.dorada]! - fichasDoradasCambio;
      jugador.fichasDisponibles[TipoFicha.azul] =
          jugador.fichasDisponibles[TipoFicha.azul]! - fichasAzulesCambio;
      jugador.fichasDisponibles[TipoFicha.roja] =
          jugador.fichasDisponibles[TipoFicha.roja]! - fichasRojasCambio;
    } else {
      print(
          "${jugador.nombres} estas intentando cambiar mas fichas de las que tienes!");
    }
  }

  //Metodo para cambiar efectivo por fichas
  void cambioEfectivoPorFichas(int fichasDoradasQueridas,
      int fichasRojasQueridas, int fichasAzulesQueridas, Jugador jugador) {
    int saldo = fichasAzulesQueridas * 25 +
        fichasRojasQueridas * 10 +
        fichasDoradasQueridas * 100;

    //Comprobacion de que pueda
    if (saldo > jugador.saldoEfectivo) {
      print("${jugador.nombres} saldo Incuficuente");
    } else {
      print(
          "${jugador.nombres} cambio exitoso!, cambiaste ${jugador.saldoEfectivo} por $fichasDoradasQueridas fichas doradas (valor 100), $fichasRojasQueridas fichas rojas (valor 10), $fichasAzulesQueridas fichas azules (valor 25).");
      jugador.saldoEfectivo = jugador.saldoEfectivo - saldo;
      jugador.fichasDisponibles[TipoFicha.dorada] =
          jugador.fichasDisponibles[TipoFicha.dorada]! + fichasDoradasQueridas;
      jugador.fichasDisponibles[TipoFicha.azul] =
          jugador.fichasDisponibles[TipoFicha.azul]! + fichasAzulesQueridas;
      jugador.fichasDisponibles[TipoFicha.roja] =
          jugador.fichasDisponibles[TipoFicha.roja]! + fichasRojasQueridas;
    }
  }
}
