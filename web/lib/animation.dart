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
  
  final List<Ball> balls = <Ball>[];

  num renderTime;
  Mouse mouse;

  Animation(this.canvas);
  
  start() {
    Rectangle rect = canvas.parent.client;
    width = rect.width;
    height = rect.height;
    mouse = new Mouse(canvas, new Point(0,0));
    var red = new Ball(this, "red", 30, new Point(100,100), mouse);
    var blue = new Ball(this, "blue", 30, new Point(300,300), mouse);
    var green = new Ball(this, "green", 30, new Point(200,400), mouse);
    var yellow = new Ball(this, "yellow", 30, new Point(width/2,height/2), mouse);
    
    balls.add(red);
    balls.add(blue);
    balls.add(green);
    balls.add(yellow);
//    ball = new Ball(this, "red", 30, new Point(width/2,height/2), mouse);
    
    canvas.onMouseDown.listen(checkMouseOver);
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
    
  for(var i=0; i<balls.length; ++i) {
    if (!mouse.down) balls[i].controlled = false;
      balls[i].draw(context);
    }
  }
  void checkMouseOver(MouseEvent event) {
    for(var ball in balls) {
      var distance = mouse.pos.distanceTo(ball.pos);
      if (!mouse.down) ball.controlled = false;
      if (mouse.myBall == ball.color) ball.controlled = true;
      else if (mouse.myBall == '' && distance <= ball.bodySize){
          mouse.controlBall(ball);
          ball.controlled = true;
      }
      else ball.controlled = false;
    }
  }
  void requestRedraw() {
    window.requestAnimationFrame(draw);
  }
}
