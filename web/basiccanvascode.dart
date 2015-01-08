import 'dart:html';


void main() {
  CanvasElement canvas = document.querySelector('#BasicCanvasCode');
  CanvasElement testCanvas = document.querySelector('#BasicCanvasCode');
  setColor(canvas, '#008000');
  
//  canvas.style.backgroundColor = "black";
//  canvas.onMouseOver.listen(mouseTester);
}
void setColor(CanvasElement canvas, String color) {
  
  CanvasRenderingContext2D context = canvas.getContext('2d');
  context.fillStyle = color;
  context.fillRect(0, 0, canvas.width, canvas.height);
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
//  ClientRect rect = canvas.getBoundingClientRect()
//  CanvasRenderingContext2D test = testCanvas.getContext('2d');
//  test.fillStyle = 'rgb(0,0,255)';
//  test.fillRect(event.client.x-1, event.client.y-2, 10, 10);
}