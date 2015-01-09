import 'dart:html';

class Mouse {
  CanvasElement canvas;
  Point pos;
  bool down = false;
  
  
  Mouse(CanvasElement c, Point p) {
    canvas = c;
    pos = p;
    canvas.onMouseMove.listen(changePos);

    canvas.onMouseDown.listen(buttonPos);
    canvas.onMouseUp.listen(buttonPos);
  }
  void buttonPos(MouseEvent event) {
    if (down) down = false;
    else down = true;
  }
  bool isDown() {
    return down;
  }
  void changePos(MouseEvent event) {
    if (down) {
      pos = new Point(event.client.x, event.client.y);
    }
  }
}