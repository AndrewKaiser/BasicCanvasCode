import 'dart:html';
import 'dart:math';

import 'lib/mouse.dart';


void main() {
  //setColor(canvas, '#008000');
  CanvasElement canvas = querySelector('#BasicCanvasCode');
  new Animation(canvas).start();
//  new Mousey(canvas).Listen();
//  canvas.onClick.listen(mouseTester);
}
void setColor(CanvasElement canvas, String color) {
  
  CanvasRenderingContext2D context = canvas.getContext('2d');
  context.fillStyle = color;
  context.fillRect(0, 0, canvas.width, canvas.height);
}





class Animation {
  CanvasElement canvas;
  num width;
  num height;
  
  Ball ball;
  num x = 0;
  num y = 0;
  Animation(this.canvas);
  
  start() {
    Rectangle rect = canvas.parent.client;
    width = rect.width;
    height = rect.height;
    
    var temp = new Ball(this, "red", 30);
    ball = temp;
    
    canvas.onMouseMove.listen(changePos);
    requestRedraw();
  }
  void changePos(MouseEvent event) {
      x = event.client.x;
      y = event.client.y;
  }
  draw([_]) {
    var context = canvas.context2D;
    drawBackground(context);
    drawBall(context);
    
    requestRedraw();
  }
  drawBackground(CanvasRenderingContext2D context) {
    context.clearRect(0, 0, width, height);
  }
  drawBall(CanvasRenderingContext2D context) {
    
//    MouseEvent event = new MouseEvent('mouse');
    
    ball.draw(context, new Point(x, y));
//    ball.draw(context, new Point(width/2, height/2));
  }
  void requestRedraw() {
    window.requestAnimationFrame(draw);
  }
}



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

void mouseTester(MouseEvent event) {
//  int xCoor = event.client.x;
//  int yCoor = event.client.y;
//
//  if(context.fillStyle == "#008000") {
//    setColor('rgb(255,255,0)');
////    context.fillStyle = 'rgb(255,255,0)';
////    context.fillRect(0, 0, canvas.width, canvas.height);
//  }
//  else {
//    setColor('green');
////    context.fillStyle = 'green';
////    context.fillRect(0, 0, canvas.width, canvas.height);
//  }
//  CanvasElement canvas = document.querySelector('#BasicCanvasCode');

//  ClientRect rect = canvas.getBoundingClientRect();
  CanvasRenderingContext2D test = canvas.getContext('2d');
  test.fillStyle = 'rgb(0,0,255)';
  test.fillRect(event.client.x-1, event.client.y-2, 10, 10);
}