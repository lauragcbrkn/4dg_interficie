PFont font;
float time = 0;
int waitTime = 60;

void setup() {
  size(800, 300);
  background(245, 245, 220);
  font = createFont("JetBrainsMono-SemiBold.ttf", 58);
  textFont(font);
}

void draw() {
  background(245, 245, 220);
  fill(0);
  textAlign(LEFT, CENTER);  // Cambiar a LEFT para un mejor control de alineación

  if (frameCount < waitTime) {
    textAlign(CENTER, CENTER);
    text("lapuri!", width / 2, height / 2);
    return;
  }
  
  float lletres_a = map(mouseX,0,width,1,10);

  int numA = int(lletres_a) + int(2.5 + 2.5 * sin(time));
  int numU = int(lletres_a) + int(2.5 + 2.5 * sin(time + PI / 2));

  String baseText = "lapuri!";
  StringBuilder animatedText = new StringBuilder();

  for (char c : baseText.toCharArray()) {
    if (c == 'a') {
      for (int i = 0; i < numA; i++) {
        animatedText.append("a");
      }
    } else if (c == 'u') {
      for (int i = 0; i < numU; i++) {
        animatedText.append("u");
      }
    } else {
      animatedText.append(c);
    }
  }

  String finalText = animatedText.toString();
  float letterSpacing = -4.1;
  float totalWidth = 0;

  for (int i = 0; i < finalText.length(); i++) {
    totalWidth += textWidth(String.valueOf(finalText.charAt(i))) + letterSpacing;
  }

  float xPosition = (width - totalWidth) / 2;  // Calcular el inicio centrado correctamente

  for (int i = 0; i < finalText.length(); i++) {
    char c = finalText.charAt(i);
    text(c, xPosition, height / 2);
    xPosition += textWidth(String.valueOf(c)) + letterSpacing;
  }

  time += 0.05;
}
