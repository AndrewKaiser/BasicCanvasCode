import 'dart:html';
import 'dart:math';

import 'lib/animation.dart';


void main() {
  //setColor(canvas, '#008000');
  CanvasElement canvas = querySelector('#BasicCanvasCode');
  new Animation(canvas).start();
}
void setColor(CanvasElement canvas, String color) {
  
  CanvasRenderingContext2D context = canvas.getContext('2d');
  context.fillStyle = color;
  context.fillRect(0, 0, canvas.width, canvas.height);
}