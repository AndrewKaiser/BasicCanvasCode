import 'dart:html';
import 'ball.dart';

class Mouse {
  CanvasElement canvas;
  Point pos;
  bool down = false;
  String myBall = '';
  
  Mouse(CanvasElement c, Point p) {
    canvas = c;
    pos = p;
    canvas.onMouseMove.listen(changePos);

    canvas.onMouseDown.listen(buttonPos);
    canvas.onMouseUp.listen(buttonPos);
  }
  void buttonPos(MouseEvent event) {
    if (down) {down = false; myBall = '';}
    else down = true;
  }
  bool isDown() {
    return down;
  }
  void changePos(MouseEvent event) {
      pos = new Point(event.client.x, event.client.y);
  }
  void controlBall(Ball b) {
    myBall = b.color;
  }
}