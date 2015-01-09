import 'dart:html';
import 'ball.dart';
import 'mouse.dart';

Element _notes = querySelector("#fps");
num _fpsAverage;
/// Display the animation's FPS in a div.
void showFps(num fps) {
  if (_fpsAverage == null) _fpsAverage = fps;
  _fpsAverage = fps * 0.05 + _fpsAverage * 0.95;
  _notes.text = "${_fpsAverage.round()} fps";
}



class Animation {
  CanvasElement canvas;
  num width;
  num height;
  num mouseX = 0;
  num mouseY = 0;
  
  Ball ball;
  num renderTime;
  Mouse mouse;

  Animation(this.canvas);
  
  start() {
    Rectangle rect = canvas.parent.client;
    width = rect.width;
    height = rect.height;
    
    var temp = new Ball(this, "red", 30);
    ball = temp;
    
    mouse = new Mouse(canvas, new Point(0,0));
    requestRedraw();
  }

  draw([_]) {
    num time = new DateTime.now().millisecondsSinceEpoch;
       if (renderTime != null) showFps(1000 / (time - renderTime));
       renderTime = time;
       
    var context = canvas.context2D;
    drawBackground(context);
    drawBall(context);
    
    requestRedraw();
  }
  drawBackground(CanvasRenderingContext2D context) {
    context.clearRect(0, 0, width, height);
  }
  drawBall(CanvasRenderingContext2D context) {
    mouseX = mouse.pos.x;
    mouseY = mouse.pos.y;
    ball.draw(context, new Point(mouseX, mouseY));
  }
  void requestRedraw() {
    window.requestAnimationFrame(draw);
  }
}
