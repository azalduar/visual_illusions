/*

 Completar la información para cada ilusión implementada
 
 Ilusión 1: Scintillating Grid 
 Author: Rupert Russell, October 2, 2010
 Implementado desde cero, adaptado o transcripción literal: Transcripción literal
 del código encontrado acá: https://www.openprocessing.org/sketch/26605
 Etiquetas (que describen la ilusión, como su categoría, procedencia, etc.): ilusión psicológica, rejilla, Hermann
 
 */

int illusions = 10;
int current = 1;
boolean active = true;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
    case 1:
      scintillating();
      break;
      // implement from here. Don't forget to add break for each case
    case 2:
      hering_ilusion();
      break;
    case 3:
      stteping_feet();
      break;
    case 4:
      translate(width/2, height/2);
      rotate(frameCount/50.0f);
      background(0);
      stereokinetic(0);
      break; 
    case 5:
      imp_triangle();
      break;
    case 6:
      gradient();
      break;
    case 7:
      cafe_wall();
      break;
    case 8:
      motion_blindness();
      break;
      //println("implementation is missed!");
    case 9:
      liliac_chaser();
      break;
    case 10:
      if(active){
        rotating_square_A();
      }else{
        rotating_square_B();
      }      
      break;
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// illusions
void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines 
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6); 
        point(i, j);
        strokeWeight(3);
      }
    }
  }
}

/*
 
 Ilusión 2: Ilusion de Hering
 Autor: Ewald Hering en 1861.
 Adaptado del código encontrado en: https://www.openprocessing.org/sketch/168636
 Etiquetas: ilusión óptica geometrica, distorción de rectas
 
 */

void hering_ilusion() {

  background(255);
  translate(390, 390);
  stroke(0, 0, 0);
  for (int i=0; i<490; i=i+10) {
    rotate(5);
    line(0, 0, 400, 400);
  }  
  strokeWeight(2);
  //color de las lineas principales
  stroke(300, 100, 0);
  rotate(-245);
  translate(-250, -250);

  //Presionar una tecla para comprobar las lineas rectas
  if (keyPressed == true) {
    background(0);
  }  
  //Lineas verticales
  for (int i=0; i<300; i=i+100) {

    line(i, -200, 200, 600);
  }
  for (int i=300; i<501; i=i+100) {

    line(i, -200, 300, 600);
  }
  //Lineas horizontales
  line(-200, 200, 800, 200);
  line(-200, 300, 700, 300);
}  

/*
 Ilusión 3: Stepping feet.
 Autor: Stuart Anstis 2003.
 Implementado desde cero, guiado por sketches cómo: https://www.openprocessing.org/sketch/157238
 Etiquetas: ilusión óptica de percepción, Distorción de relidad
 */
float x;

void stteping_feet() {
  //Dibujando lineas de fondo
  for (int i = 0; i < 70; i++) {
    noStroke();
    fill(0);
    rect(i * 20, 0, 10, height);
  }

  for (int j=0; j<9; j++) {
    if (j%2==0) {
      fill(0);
    } else {
      fill(255);
    }
    //rectangulos
    rect(x, j*90 + 5, 60, 50);
  }
  //linea que encierra para comprobar el efecto
  if (keyPressed==true) {
    stroke(0, 0, 255);
    strokeWeight(5);
    noFill();
    rect(x, 5, 60, 900);
  }    
  x =  x+1;
  if (x > width) {
    x = 0;
  }
}

/* Ilusión 4:Stereokinetic Effect (SKE) .
 Autor: Musatti(1924).
 Adaptado de: https://www.openprocessing.org/sketch/135459, para que se pueda
 ver en dos perspectivas, hacia adentro (cómo tunel) o fuera, cómo cono.
 Etiquetas: ilusión óptica tridimensional, SKE
 */
void stereokinetic(int i) {

  if (i == 17) return;
  fill(255, 0, 0);
  if (i%2==0) {
    fill(0, 0, 0);
  }
  int j = (i > 20) ? -10 : 10;
  translate(j, 0);
  ellipse(0, 0, 300 - (i*20), 300 - (i*20));
  stereokinetic(i+1);
}

/* Ilusión 5:Triangulo de Penrose.
 Autor:  Oscar Reutersvärd - 1934
 Adaptado de:https://www.openprocessing.org/sketch/375583
 Etiquetas: Figuras Imposibles, Objetos Imposibles
 */
color bg, c1, c2, c3;
float e = 70;
float w = 75;

void drawSide() {
  float sin30, sin60, cos30, cos60;
  sin30 = cos60 = sin(PI / 6);
  cos30 = sin60 = cos(PI / 6);
  beginShape();
  float x1 = -e * cos60;
  float y1 = (e * cos60) / sqrt(3);
  vertex(x1, y1);
  float x2 = x1 - w;
  float y2 = y1;
  vertex(x2, y2);
  float x3 = x2 + (e + 3.0 * w) * cos60;
  float y3 = y2 - (e + 3.0 * w) * sin60;
  vertex(x3, y3);
  float x4 = x3 + (e + 4.0 * w) * sin30;
  float y4 = y3 + (e + 4.0 * w) * cos30;
  vertex(x4, y4);
  float x5 = x4 - w * cos60;
  float y5 = y4 + w * sin60;
  vertex(x5, y5);
  float x6 = x5 - (e + 3 * w) * cos60;
  float y6 = y5 - (e + 3 * w) * sin60;
  vertex(x6, y6);
  endShape(CLOSE);
}
void imp_triangle() {
  background(0);
  c1 = color(250, 0, 0);
  c2 = color(250, 0, 0);
  c3 = color(250, 0, 0);
  translate(width / 2, height * 3 / 5);
  fill(c1);
  drawSide();
  rotate(TWO_PI / 3);
  fill(c2);
  drawSide();
  rotate(TWO_PI / 3);
  fill(c3);
  drawSide();
}

/* Ilusión 6: Bandas de Mach
 Autor:  Williams SM, Purves D (1999)
 Adaptado de: https://www.openprocessing.org/sketch/168577
 Etiquetas: Efectos opticos de color, efecto gradiente, efecto de brillo
 */
float angle = 0;
void gradient() {
  float c = (cos(angle + PI/2) * width/2) + width/2;
  angle += 0.1;

  for (int i=0; i<800; i++) {
    stroke(i/2);
    line(i, 0, i, 800);
  }
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0, 0, c, 800);
  //Rectángulo
  fill(150);
  rectMode(CENTER);
  rect(width/2, height/2, 600, 80);
    
}

/* Ilusión 7: Cafe Wall
 Autor: Richard Gregory - 1973
 Adaptado de: https://www.openprocessing.org/sketch/172558
 Etiquetas: Movimiento Ilusorio
 */
void cafe_wall(){
  int step=20;
  int alpha=0;
  for (int i=0; i<800; i=i+40) {
    stroke(255,0,0);
    strokeWeight(4);
    line (0,i, width, i);
  }
  noStroke();
  for (int y=0; y<800; y=y+40) {
    for (int x=0; x<800; x=x+80) {
    fill(0,0,0);
    rect (x+alpha, y+2, 38, 38);
    }  
    alpha=alpha+step;
     if (alpha==40){
      step=-20;
    } 
    if (alpha==0){
      step=20;
    } 
   }
}

/* Ilusión 8: Motion Induced Blindness (MIB)
 Autor: Grindley and Townsend in 1965
 Adaptado de: https://www.openprocessing.org/sketch/168594
 Etiquetas: Fenómeno visual, visual disappearance
 */
 class Grid {
  Grid() {
  }

  void draw() {
    stroke(0, 0, 255);
    for (int x=-300; x<300; x=x+40) {
      for (int y=-300; y<300; y=y+40) {
        line(x, y+13, x+26, y+13);
        line(x+13, y, x+13, y+26);
      }
    }
  }
}
 
 void motion_blindness(){
   background(0);
  //Surrounding ellipses
  fill(255, 255, 0);
  noStroke();
  ellipse(240, 240, 8, 8);
  ellipse(560, 240, 8, 8);
  ellipse(400, 560, 8, 8);
  //Grid
  Grid grid = new Grid();
  translate(400, 400);
  rotate(millis()/1000.0);
  grid.draw();
  //Center Ellipse
  if ((frameCount/20) % 2 == 0) {
    noStroke();
    fill(100, 255, 100);
    ellipse(-7, -7, 8, 8);
  }
}


class Disc {
  float x, y;
  float diameter;
  boolean on = false;
   
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos; 
    diameter = 100;
    on = true;
  }

  void display() {
    if (on == true) {
      fill(200, 162, 200);
      noStroke();
      ellipse(x, y, diameter, diameter);
    }
  }
  
  void hide(float xpos, float ypos) {
    x = xpos;
    y = ypos; 
    diameter = 150;
    noStroke();
    fill(135, 135, 135);
    ellipse(x, y, diameter, diameter);
  }
}
// ILUSION 1

void liliac_chaser() {
  background(135, 135, 135);
  
  Disc[] discs;
  int numDiscs = 12;
  discs = new Disc[numDiscs]; 
  int x_coord = 0;
  int y_coord = 0;
  for (int i = 0; i < discs.length; i++) {
    x_coord = (int)(400 + 300*cos(PI*i/6));
    y_coord = (int)(400 + 300*sin(PI*i/6));
    discs[i] = new Disc();
    discs[i].start(x_coord, y_coord);    
    discs[i].display();
  }
  
  x_coord = 0;
  y_coord = 0;
  int t = (millis()/300)%12;
  
  for (int j = 0; j < discs.length; j++) {
    //delay(50);
    x_coord = (int)(400 + 300*cos(PI*j/6));
    y_coord = (int)(400 + 300*sin(PI*j/6));
    if (t == j) {
      discs[j].display();
      fill(135, 135, 135);
      discs[j].hide(x_coord, y_coord);
      delay(100);
      fill(0, 0, 0);
    }
  }
  
  strokeWeight(3);  
  stroke(0);
  line(400, 410, 400, 390);
  line(410, 400, 390, 400);
}

void rotating_square_A() {
  
  background(255);
  frameRate(60);
  
  pushMatrix(); 
  translate(400,400);
  noStroke();
  fill(25,25,112);
  rotate(millis()/1000.0f);
  rect(-200, -200, 400, 400); 
  popMatrix();
    
  noStroke();
  fill(221,160,221);
  rect(0,0,380,380);
  rect(420,0,380,380);
  rect(0,420,380,380);
  rect(420,420,380,380);  
}

void rotating_square_B() {
  
  background(255);
  frameRate(60);
  
  pushMatrix(); 
  translate(400,400);
  noStroke();
  fill(25,25,112);
  rotate(millis()/1000.0f);
  rect(-200, -200, 400, 400); 
  popMatrix();
}
