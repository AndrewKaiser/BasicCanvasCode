library mouse;

import 'dart:html';

class Mousey {
  CanvasElement canvas;
  
  Point pos;
  
  Mousey(this.canvas);
  
  Listen() {
    pos = new Point(0,0);
    canvas.onMouseMove.listen(changePos);
  }
  changePos(MouseEvent e) {
    pos.x = e.client.x;
    pos.y = e.client.y;
  }
}
