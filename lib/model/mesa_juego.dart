import 'package:dart_application_1/enum/tipo_ficha.dart';
import 'package:dart_application_1/model/jugador.dart';
import 'package:dart_application_1/model/repartidor.dart';

class MesaJuego {
  //Atributos
  Repartidor repartidor;
  Jugador jugador1;
  Jugador jugador2;

  //Constructor
  MesaJuego({
    required this.repartidor,
    required this.jugador1,
    required this.jugador2,
  });

  //Metodos
  void juego(Jugador jugador1, Jugador jugador2, Repartidor repartidor) {
    //Cambiamos el efectivo de los jugadores por fichas
    repartidor.cambioEfectivoPorFichas(50, 0, 0, jugador1);
    repartidor.cambioEfectivoPorFichas(50, 0, 0, jugador2);
    //Simulamos todos los juegos posibles de Cara o cruz hasta que uno de los jugadores se quede sin fichas

    repartidor.lanzarNuevoJuego(jugador1, 'cara');
    repartidor.lanzarNuevoJuego(jugador2, 'cruz');

    //Cambiamos las fichas del ganador por saldo en efectivo
    if (jugador2.fichasDisponibles[TipoFicha.azul]! == 0 &&
        jugador2.fichasDisponibles[TipoFicha.roja]! == 0 &&
        jugador2.fichasDisponibles[TipoFicha.dorada]! == 0) {
      repartidor.cambioFichasPorEfectivo(
          jugador1.fichasDisponibles[TipoFicha.dorada]!,
          jugador1.fichasDisponibles[TipoFicha.roja]!,
          jugador1.fichasDisponibles[TipoFicha.azul]!,
          jugador1);
    } else {
      repartidor.cambioFichasPorEfectivo(
          jugador2.fichasDisponibles[TipoFicha.dorada]!,
          jugador2.fichasDisponibles[TipoFicha.roja]!,
          jugador2.fichasDisponibles[TipoFicha.azul]!,
          jugador2);
    }
    //Nombramos a los jugadores y repartidor, decir quién ganó y con cuánto dinero quedó cada uno
    print(
        "El jugador 1: ${jugador1.nombres} ${jugador1.apellidos}, el jugador 2: ${jugador2.nombres} ${jugador2.apellidos} y el repartidor ${repartidor.nombres} ${repartidor.apellidos}, el ganador fue ${jugador1.saldoEfectivo == 0 ? jugador2.nombres : jugador1.nombres}, el jugador 1 quedo con ${jugador1.saldoEfectivo}, el jugador 2 quedo con ${jugador2.saldoEfectivo}");
  }
}
