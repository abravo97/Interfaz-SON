/*
Interfaz para la pantalla táctil del gadget SON
Trabajo de Andrés Bravo, Valeria Barrantes y Luana Padua
*/
PFont mL;
PFont mR;
PFont mM;
PFont mB;

PImage blq;
PImage blq50;
PImage sombrero;
PImage sombra;
PImage lentes;
PImage ropa;
PImage tiempo;

PImage blqDesac;
PImage blqActiv;

boolean recordatorio = false;

int verde = #B3E054;
int amarillo = #EBD93A;
int naranja = #EBA43A;
int rojo = #EA5959;
int violeta = #C459EA;
int nivel;

int blanco = 255;
int gMedio = 128;
int gOscuro = 89;
int gClaro = 191;
int gFondo = 59;

int t = 0;
int tUV = 0;
int tR = 0;

int UV;

String ppUV;
String ppIndex;
String ppMensaje;
String ppHora;
String ppFecha;

String cTexto;

int page;

void setup() { // ------------------------------------------------- SETUP INICIAL -------------------------------------
  
  mL = loadFont("Montserrat-Light-96.vlw");
  mR = loadFont("Montserrat-Regular-96.vlw");
  mM = loadFont("Montserrat-Medium-96.vlw");
  mB = loadFont("Montserrat-Bold-96.vlw");
  
  blq = loadImage("bloqueador.png");
  blq50 = loadImage("bloqueador50.png");
  sombrero = loadImage("sombrero.png");
  sombra = loadImage("sombra.png");
  lentes = loadImage("lentes.png");
  ropa = loadImage("ropa.png");
  tiempo = loadImage("tiempo.png");
  
  blqActiv = loadImage("blq activ.png");
  blqDesac = loadImage("blq desac.png");
  
  size(320,240); //tamaño del fondo size(ancho,alto)
  background(gFondo); //color del fondo

  noStroke();
  
  UV = int(random(15));
  
  page = 2;
  
}

void MainPage () { //--------------------------------------------- PÁGINA PRINCIPAL --------------------------------------

// ---------------------------------- CUADROS DE ÍNDICE UV
    fill(#535C40); //verde
    rect(0,0, 64,60);
    
    fill(#5E5B3B); //amarillo
    rect(64,0, 64,60);
      
    fill(#5E503B); //naranja
    rect(128,0, 64,60);
      
    fill(#5E4141); //rojo
    rect(192,0, 64,60);
      
    fill(#56415E); //violeta
    rect(256,0, 64,60);
    
    // ----------------------------- CUADRO RESALTADO
    if (UV < 3){
      fill(verde); //verde
      rect(0,0, 64,60); 
      
      ppIndex = "BAJO";
      nivel = verde;
      
      ppMensaje = "No es necesario usar protección contra el sol";
      }
      
    else if (UV >= 3 && UV <= 5) {
      fill(amarillo); //amarillo
      rect(64,0, 64,60);
      
      ppIndex = "MODERADO";
      nivel = amarillo;
      
      ppMensaje = "Es recomendable usar cierta protección contra el sol.";
     }
    
    else if (UV == 6 || UV == 7) {
      fill(naranja); //naranja
      rect(128,0, 64,60);
      
      ppIndex = "ALTO";
      nivel = naranja;
      
      ppMensaje = "Se requiere usar cierta protección contra el sol";
     }
     
    else if (UV >= 8 && UV <= 10) {
      fill(rojo); //rojo
      rect(192,0, 64,60);
      
      ppIndex = "MUY ALTO";
      nivel = rojo;
      
      ppMensaje = "Es necesario usar bastante protección contra el sol";
     }
     
    else if (UV >= 11) {
      fill(violeta); //violeta
      rect(256,0, 64,60);
      
      ppIndex = "EXTREMO";
      nivel = violeta;
      
      ppMensaje = "Se requiere mucha protección. De preferencia esté a la sombra";
     }
  
  //------------------------------ Texto página principal
  
  ppUV = "Nivel de radiación: " + str(UV);
  
  ppHora = str(hour()) + ":" + str(minute());
  
  ppFecha = str(day()) + " / " + month() + " / " + year();
  
  fill(gFondo);
  rect(0,60, 320,240);
  
  textFont(mR,12);
  fill(gClaro);
  textAlign(CENTER);
  text(ppUV, 160, 85); 
  
  textFont(mB,35);
  fill(nivel);
  textAlign(CENTER);
  text(ppIndex, 160, 120);
  
  textFont(mR,12);
  fill(blanco);
  textAlign(CENTER, CENTER);
  text(ppMensaje, 30,120, 260,60);
  
  textFont(mR,20);
  fill(gClaro);
  textAlign(CENTER, TOP);
  text(ppHora, 160,180);
  
  textFont(mR,12);
  fill(gClaro);
  textAlign(CENTER, TOP);
  text(ppFecha, 160,200);
  
  
}

void Consejo () { //------------------------------------------- PANTALLA DE CONSEJOS --------------------------------------------

  imageMode(CENTER);
  
  image(blq, 290, 120);
  
  image(blq50, 51,150);
  image(sombrero, 95, 150);
  image(sombra, 138, 150);
  image(lentes, 181, 150);
  image(ropa, 225, 150);
  image(tiempo, 268, 150);

  fill(blanco);

  textFont(mM,20);
  textAlign(LEFT);
  text("Consejos", 30,60);
  
  cTexto = "Se recomienda tomar las siguientes precauciones: ";
  
  textFont(mR,12);
  textAlign(LEFT, CENTER);
  text(cTexto, 30,60, 260,60);
  
}

void Bloqueador () { //-------------------------------------- RECORDATORIO DE BLOQUEADOR --------------------------------------


  fill(blanco);

  textFont(mM,20);
  textAlign(LEFT);
  text("Bloqueador solar", 30,60);
  
  
  if (recordatorio == false) {
    imageMode(CORNER);
    image(blqDesac, 236, 60);
    
    textFont(mR,13);
    textAlign(LEFT, BOTTOM);
    text("Recordatorio de reaplicación de bloqueador solar:", 30,60 ,195,55 );
    
    textFont(mB,13);
    textAlign(LEFT, TOP);
    text("desactivado", 30,120 ,195,60 );
    
    fill(gOscuro);
    rect(63,180, 195,24 ,12);
    
    fill(gClaro);
    textFont(mM,12);
    textAlign(CENTER, CENTER);
    text("activar recordatorio", 63,180, 195,24 );
  }
  
  else {
    
    imageMode(CORNER);
    image(blqActiv, 236, 60);
    
    textFont(mR,13);
    textAlign(LEFT, BOTTOM);
    text("Reaplicación de bloqueador solar en:", 30,60 ,195,55 );
    
    textFont(mB,13);
    textAlign(LEFT, TOP);
    text("1 horas y 20 minutos", 30,120 ,195,60 );
    
    fill(gClaro);
    rect(63,180, 195,24 ,12);
    
    fill(gFondo);
    textFont(mM,12);
    textAlign(CENTER, CENTER);
    text("desactivar recordatorio", 63,180, 195,24 );
  }
}

void draw() { //--------------------------------------------- CICLO PRINCIPAL --------------------------------------------------
  t = millis();
  
  // ---------------------------------- NIVEL DE UV
  if (t - tUV > 2000){
    tUV = t;
    UV = int(random(13));
  }
  
  if (page == 1) {
    Consejo();
  }
  else if (page == 2) {
    MainPage();
  }
  else if (page == 3) {
    Bloqueador();
  }
  
}

void mouseClicked() {
  if (mouseX > 63 && mouseX < 258 && mouseY > 180 && mouseY < 204 && page == 3) {
    recordatorio = !recordatorio;
    background(gFondo);
  
  }
  
  if (mouseX < 30 && (page == 2 || page == 3)) {
    page --;
    background(gFondo);
  }
  
  if (mouseX > 290 && (page == 1 || page == 2)) {
    page ++;
    background(gFondo);
  }
}
