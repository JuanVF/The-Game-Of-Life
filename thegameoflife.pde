//Puedes cambiar las dimensiones del juego y la tabla, pero, la variable tamanoTabla debe ser mayor a estado inicial
int tamanoTabla = 60;
int estadoInicial[][] = new int[tamanoTabla][tamanoTabla];

void setup(){
  size(500,500);
  frameRate(60);
  
  //Inicializacion del estado inicial del juego
  
  estadoInicial[1][4] = 1;
  estadoInicial[1][5] = 1;
  estadoInicial[2][4] = 1;
  estadoInicial[2][5] = 1;
  
  estadoInicial[11][4] = 1; 
  estadoInicial[11][5] = 1;
  estadoInicial[11][6] = 1;
  estadoInicial[12][3] = 1;
  estadoInicial[12][7] = 1;
  estadoInicial[13][2] = 1;
  estadoInicial[13][8] = 1;
  estadoInicial[14][2] = 1;
  estadoInicial[14][8] = 1;
  
  estadoInicial[15][5] = 1;
  
  estadoInicial[16][3] = 1;
  estadoInicial[16][7] = 1;
  estadoInicial[17][4] = 1;
  estadoInicial[17][5] = 1;
  estadoInicial[17][6] = 1;
  estadoInicial[18][5] = 1;
  
  estadoInicial[21][2] = 1;
  estadoInicial[21][3] = 1;
  estadoInicial[21][4] = 1;
  estadoInicial[22][2] = 1;
  estadoInicial[22][3] = 1;
  estadoInicial[22][4] = 1;
  estadoInicial[23][1] = 1;
  estadoInicial[23][5] = 1;
  
  estadoInicial[25][0] = 1;
  estadoInicial[25][1] = 1;
  estadoInicial[25][5] = 1;
  estadoInicial[25][6] = 1;
  
  estadoInicial[35][2] = 1;
  estadoInicial[35][3] = 1;
  estadoInicial[36][2] = 1;
  estadoInicial[36][3] = 1;
  
  crearTabla(estadoInicial);
}

void draw(){
  estadoInicial = obtenerSobrevivientes(estadoInicial);
  crearTabla(estadoInicial);
}

int[][] obtenerSobrevivientes(int positions[][]){
  int sobrevivientes[][] = new int[tamanoTabla][tamanoTabla];
  for(int col = 0; col < tamanoTabla; col++){
    for(int row = 0; row < tamanoTabla; row++){
      if(vaASobrevivir(positions, col, row)){
        sobrevivientes[col][row] = 1;
      }else{
        sobrevivientes[col][row] = 0;
      }
    }
  }
  return sobrevivientes;
}


boolean vaASobrevivir(int positions[][], int col, int row){
  boolean estaMuerta = positions[col][row] == 0;
  int vecinos = obtenerVecinos(positions, col, row);
  
  if(estaMuerta && vecinos == 3){
    return true;
  }else if(!estaMuerta && (vecinos == 2 || vecinos == 3)){
    return true;
  }
  
  return false;
}

int obtenerVecinos(int positions[][], int col, int row){
  int vecinos = 0;
  int posArriba = row - 1;
  int posAbajo = row + 1;
  int posDerecha = col + 1;
  int posIzquierda = col - 1;
  int tamano = tamanoTabla - 1;
  
  if(posArriba >= 0 && positions[col][posArriba] == 1){
    vecinos += 1;
  }
  
  if(posAbajo <= tamano && positions[col][posAbajo] == 1){
    vecinos += 1;
  }
  
  if(posDerecha <= tamano && positions[posDerecha][row] == 1){
    vecinos += 1;
  }
  
  if(posIzquierda >= 0 && positions[posIzquierda][row] == 1){
     vecinos += 1;
  }
  
  if(posArriba >= 0 && posDerecha <= tamano && positions[posDerecha][posArriba] == 1){
    vecinos += 1;
  }
  
  if(posArriba >= 0 && posIzquierda >= 0 && positions[posIzquierda][posArriba] == 1){
    vecinos += 1;
  }
  
  if(posAbajo <= tamano && posDerecha <= tamano && positions[posDerecha][posAbajo] == 1){
    vecinos += 1;
  }
  
  if(posAbajo <= tamano && posIzquierda >= 0 && positions[posIzquierda][posAbajo] == 1){
    vecinos += 1;
  }
  
  return vecinos;
}

void crearTabla(int positions[][]){
  
  for(int i = 0; i < tamanoTabla; i++){
    crearColumna(i,positions);
  }
}

void crearColumna(int columna, int positions[][]){
  int x0 = 10 * columna - 10;
  int y0 = 0;
  int x1 = 10 * columna;
  int y1 = 10 * columna;
  
  for(int i = 0; i < tamanoTabla; i++){
    if(positions[columna][i] == 1){
      fill(54, 54, 54);
    }else{
      fill(255, 255, 255);
    }
    rect(x0, y0, x1, y1);
    
    y1 += 10;
    y0 += 10;
  }
}
