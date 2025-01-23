import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;

int colorSwitch = 0;  
boolean colorChangeEnabled = true;  

float top_exclamacio = 100;
float alt_exclamacio = 200;
float diametre_punt = 200;

boolean exportPDF = false;  
boolean exportPNG = false;  

void setup() {
  size(800, 500);
  cp5 = new ControlP5(this);

  cp5.addSlider("top_exclamacio")
    .setPosition(50, 90)
    .setRange(30, width / 2)
    .setValue(100)
    .setLabel("Ancho Rectángulo");

  cp5.addSlider("alt_exclamacio")
    .setPosition(50, 130)
    .setRange(70, 400)
    .setValue(200)
    .setLabel("Altura Rectángulo");

  cp5.addSlider("diametre_punt")
    .setPosition(50, 170)
    .setRange(20, 100)
    .setValue(50)
    .setLabel("Tamaño Círculo");

  cp5.addToggle("colorChangeEnabled")
    .setPosition(50, 210)
    .setSize(50, 20)
    .setLabel("Cambio de Color")
    .setValue(true);

  cp5.addSlider("exportPDF")
    .setPosition(50, 250)
    .setRange(0, 1)
    .setValue(0)
    .setLabel("Exportar a PDF");

  cp5.addSlider("exportPNG")
    .setPosition(50, 290)
    .setRange(0, 1)
    .setValue(0)
    .setLabel("Exportar a PNG");
}

void draw() {
  if (colorChangeEnabled) {
    if (frameCount % 180 == 0) {
      colorSwitch = (colorSwitch + 1) % 2; 
    }
  }

  if (colorSwitch == 0) {
    background(92, 176, 128); 
    fill(255, 171, 194); 
  } else {
    background(74, 107, 232); 
    fill(229, 224, 33); 
  }

  pushMatrix();
  translate(width / 2, height / 2 + 100); 

  noStroke(); 

  float rectHeight = constrain(alt_exclamacio, 70, 400); 
  float rectWidth = constrain(top_exclamacio, 30, width / 2); 
  float circleSize = diametre_punt; 
  
  beginShape();
  vertex(-20, 0); 
  vertex(-rectWidth, -rectHeight); 
  vertex(rectWidth, -rectHeight); 
  vertex(20, 0); 
  endShape(CLOSE);

  float circleY = 60; 
  ellipse(0, circleY, circleSize, circleSize); 

  popMatrix();

  if (exportPDF) { 
    beginRecord(PDF, "exported_image.pdf");
    drawContent();
    endRecord();
    exportPDF = false;  
  }

  if (exportPNG) {  
    save("exported_image.png");
    exportPNG = false;  
  }
}

void drawContent() {
  if (colorSwitch == 0) {
    background(92, 176, 128); 
    fill(255, 171, 194); 
  } else {
    background(74, 107, 232); 
    fill(229, 224, 33); 
  }

  pushMatrix();
  translate(width / 2, height / 2 + 100); 

  noStroke(); 

  float rectHeight = constrain(alt_exclamacio, 70, 400); 
  float rectWidth = constrain(top_exclamacio, 30, width / 2); 
  float circleSize = diametre_punt; 
  
  beginShape();
  vertex(-20, 0); 
  vertex(-rectWidth, -rectHeight); 
  vertex(rectWidth, -rectHeight); 
  vertex(20, 0); 
  endShape(CLOSE);

  float circleY = 60; 
  ellipse(0, circleY, circleSize, circleSize); 

  popMatrix();
}
