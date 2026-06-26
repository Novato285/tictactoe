import 'dart:io';
void main () {
  bool seguirjugando = true; //Controla si se vuelve a jugar o no
  String ultimojugador = ''; //Variable para guardar el ultimo jugador que gano
  while (seguirjugando == true) {
  List<List<String>> tablero = [['-','-','-'],['-','-','-'],['-','-','-']]; //creacion de tablero
  String turno = 'X'; //Variable para controlar el turno de los jugadores
  bool gameOver = false; //Variable para controlar el estado del juego
  bool empate = false; //Variable para controlar el empate

  //Comprueba si ya ha habido un ganador previo y le asigna el primer turno al ganador, sino ha habido ningun jugador entonces selecciona X como predeterminado
  if (ultimojugador == '') {
    turno = 'X';
    print('Primer turno: X');
  } else if (ultimojugador == 'O') {
    turno = 'O';
    print('Primer turno: O');
  } else if (ultimojugador == 'X') {
    turno = 'X';
    print('Primer turno: X');
  };
  
  while (gameOver == false && empate == false) { //Mientras el juego no haya terminado o no haya empate, se ejecuta el ciclo
    stdout.write('Ingrese la fila (1,2 o 3): '); //Pide al usuario ingresar fila
    String? fila = stdin.readLineSync();//Lee la fila
    int? filaP = int.tryParse(fila!); //Intenta convertir la fila de String a int, sino lo logra, lo convierte en valor nulo
    if (filaP == null) { //Si la fila no se pudo convertir a int, entonces imprime mensaje de error
      print('Fila invalida, por favor elige otra fila');
      continue;
    }else{
    filaP = filaP -1; //Resta 1 al valor ingresado por el usuario para hacer coincidir el indice con la seleccion
    };
    if (filaP <0 || filaP >= tablero.length) { //Comprueba que la fila sea valida, si no lo es entonces imprime mensaje de error
    print ('Fila invalida, por favor elige otra fila');
    continue;
    };

    //Misma logica que la fila pero en la columna
    stdout.write('Ingrese la columna (1,2 o 3): ');
    String? columna = stdin.readLineSync();
    int? columnaP = int.tryParse(columna!);
    if (columnaP == null) {
      print('Columna invalida, por favor elige otra columna');
      continue;
    }else{
    columnaP = columnaP -1;
    };
    if (columnaP <0 || columnaP >= tablero[0].length) {
    print ('Columna invalida, por favor elige otra columna');
    continue;
    };

    if (tablero[filaP][columnaP] == '-'){ //Si la fila es valida entonces comprueba la casilla vacia
      tablero[filaP][columnaP] = turno;
    } else { //Si la casilla esta ocupada entonces pide elegir otra casilla
      print('La casilla esta ocupada, elije otra casilla');
      continue;
    };

    for (int i = 0; i <tablero.length; i++) { //Detecta el tamano del tablero y lo construye en base a eso
      String fila;
      fila = ''; //Recorre cada fila, inicializa la variable fila
      for (int j = 0; j <tablero[i].length; j++){
        fila = fila + tablero[i][j]; //Toma la casilla de la fila donde se encuentra y la encadena en la variable fila
      };
    print(fila); //Imprime fila por fila en cada ciclo
    };

    if (tablero[0][0] == tablero[0][1] && tablero[0][1] == tablero[0][2] && tablero[0][0] != '-'||
        tablero[1][0] == tablero[1][1] && tablero[1][1] == tablero[1][2] && tablero[1][0] != '-'||
        tablero[2][0] == tablero[2][1] && tablero[2][1] == tablero[2][2] && tablero[2][0] != '-'||
        tablero[0][0] == tablero[1][0] && tablero[1][0] == tablero[2][0] && tablero[0][0] != '-'||
        tablero[0][1] == tablero[1][1] && tablero[1][1] == tablero[2][1] && tablero[0][1] != '-'||
        tablero[0][2] == tablero[1][2] && tablero[1][2] == tablero[2][2] && tablero[0][2] != '-'||
        tablero[0][0] == tablero[1][1] && tablero[1][1] == tablero[2][2] && tablero[0][0] != '-'||
        tablero[0][2] == tablero[1][1] && tablero[1][1] == tablero[2][0] && tablero[0][2] != '-') {
      gameOver = true;
    } //Reglas de gane
    if (tablero[0][0] != '-' && tablero[0][1] != '-' && tablero[0][2] != '-' &&
        tablero[1][0] != '-' && tablero[1][1] != '-' && tablero[1][2] != '-' &&
        tablero[2][0] != '-' && tablero[2][1] != '-' && tablero[2][2] != '-') {
      empate = true;
      print('Empate!');
    } //Reglas de empate

  //Si el juego no ha terminado de ninguna forma entonces cambia de turno
  if (gameOver == false && empate == false){
  if (turno == 'X') {
    turno ='O';
    print('Turno del jugador O');
  } else if (turno == 'O') {
    turno = 'X';
    print('Turno del jugador X');
  } //cambio de turno
  };

  if (gameOver == true && empate == false) {
    String ganador = turno; //Guarda el turno del ganador antes de cambiar turno
    print('El jugador $ganador ha ganado!');
    ultimojugador = ganador;
  } //ganador
  }

  stdout.write('Desea jugar otra partida? (si/no): '); //Pregunta si desea jugar otra partida
  String? respuesta = stdin.readLineSync(); //Lee respuesta
  String respuestaMayus = respuesta!.toUpperCase(); //Convierte respuesta a mayusculas
  if (respuestaMayus == 'SI') { 
    seguirjugando = true; //Si la respuesta es SI, se reinicia el juego
  } else if (respuestaMayus == 'NO') {
    seguirjugando = false; //Si la respuesta es NO, se termina el juego
  } else {
    print ('Respuesta invalida, se tomara como respuesta NO');
    seguirjugando = false; //Si la respuesta no es SI, ni NO, se termina el juego
  }
  }

}