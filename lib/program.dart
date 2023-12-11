import 'package:dart_application_1/enum/tipo_ficha.dart';
import 'package:dart_application_1/model/jugador.dart';
import 'package:dart_application_1/model/mesa_juego.dart';
import 'package:dart_application_1/model/repartidor.dart';

void main(List<String> args) {
  //Creamos el jugador 1
  Jugador jugador1 = Jugador(
      nombres: 'Miguel',
      apellidos: 'Quijano',
      identificacion: 1001,
      fichasDisponibles: {
        TipoFicha.azul: 0,
        TipoFicha.dorada: 0,
        TipoFicha.roja: 0
      },
      saldoEfectivo: 5000);

  //Creamos el jugador 2
  Jugador jugador2 = Jugador(
      nombres: 'Mateo',
      apellidos: 'Muñoz',
      identificacion: 1001,
      fichasDisponibles: {
        TipoFicha.azul: 0,
        TipoFicha.dorada: 0,
        TipoFicha.roja: 0
      },
      saldoEfectivo: 5000);

  //Creamos el repartidor
  Repartidor repartidor = Repartidor(
      nombres: 'Pablo',
      apellidos: 'Jaramillo',
      identificacion: 1234,
      fichasDisponibles: {
        TipoFicha.azul: 0,
        TipoFicha.dorada: 0,
        TipoFicha.roja: 0,
      },
      saldoEfectivo: 1394037);

  /*
  //Vemos cuanto es el saldo actual del jugador 1
  print("El saldo actual del jugador 1 es: ${jugador1.saldoEfectivo}");

  //El repartidor lanza un nuevo juego
  repartidor.lanzarNuevoJuego(
    jugador1,
    'cara',
  );

  //Vemos cuanto es el saldo nuevo del jugador 1
  print("El NUEVO saldo actual del jugador 1 es: ${jugador1.saldoEfectivo}");

  //El repartidor le cambia fichas por efectivo al jugador 2
  repartidor.cambioFichasPorEfectivo(8, 2, 10, jugador2);

  //Vemos cuanto es el saldo actual del jugador 2
  print("El saldo actual del jugador 2 es: ${jugador2.saldoEfectivo}");

  //El repartidor le cambia efectivo por fichas al jugador 1
  repartidor.cambioEfectivoPorFichas(4, 8, 10, jugador1);
*/

  //Creamos una mesa de juego
  MesaJuego juego =
      MesaJuego(repartidor: repartidor, jugador1: jugador1, jugador2: jugador2);

  //Iniciamos un juego con los dos jugadores y el repartidor
  juego.juego(jugador1, jugador2, repartidor);
}
