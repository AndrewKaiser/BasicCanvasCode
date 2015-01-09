import 'dart:html';
import 'dart:math';
import 'animation.dart';


class Ball {
  final String color;
  final Animation screen;
  final num speed = 5;
  Point pos;
  num bodySize;
  
  Ball(this.screen, this.color, this.bodySize);
  
  draw(CanvasRenderingContext2D context, Point pos) {
    context..lineWidth = 0.5
           ..fillStyle = color
           ..strokeStyle = color;
    
    context..shadowOffsetX = 0
             ..shadowOffsetY = 0
             ..shadowBlur = 0;
    
    context..beginPath()
           ..arc(pos.x, pos.y, bodySize, 0, PI * 2, false)
           ..fill()
           ..closePath()
           ..stroke();
  }
}