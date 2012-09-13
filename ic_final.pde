/*  Properties
_________________________________________________________________ */

PGraphics canvas;
int canvas_width = 3508;
int canvas_height = 4961;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

int rSize = 200;         //Size of rect
int rSpace = 100;        //Spacing between rect
int rIncrease = 70;      //Increase in spacing
  
float eRadius;       //Radius of Ice Cream

/*  Setup
_________________________________________________________________ */

void setup()
{ 
  size(1300, 850);
  background(30);
  smooth();
  
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  
  calculateResizeRatio();
  
  canvas.beginDraw();
    canvas.background(255);
    canvas.stroke(0);
    // canvas.smooth();
    
    canvas.strokeWeight(45);    //thicker for drawing
    rSize = canvas.width/25;
 
    //ICE CREAM
    eRadius = 90/ratio;
    canvas.pushMatrix();
    for (int i=0; i< 4; i++){
    if (i > 2) {
      eRadius=1900; 
      eRadius=2.7*(80/ratio);
      canvas.translate(-2500,-400);
      //canvas.translate(canvas.width/2,canvas.height);
    }
      canvas.ellipse((canvas.width/2)+(i*eRadius)-eRadius, ((canvas.height/2)-(10)), eRadius, eRadius);
    }
    canvas.popMatrix();
     
    // triangle cuts off bottom of ellipse
    canvas.stroke(255);
    //canvas.stroke(0); // use this to see triangle
    canvas.triangle((canvas.width/2)-4*((sqrt((rSize*rSize)/2))+((sqrt((rSpace*rSpace)/2)))), (canvas.height/2)+1*((sqrt((rSize*rSize)/2))), canvas.width/2, (canvas.height/2)+5*((sqrt((rSize*rSize)/2))+((sqrt((rSpace*rSpace)/2)))), (canvas.width/2)+4*((sqrt((rSize*rSize)/2))+((sqrt((rSpace*rSpace)/2)))), (canvas.height/2)+1*((sqrt((rSize*rSize)/2))));
    canvas.stroke(0);
   
    canvas.pushMatrix();
    canvas.translate((canvas.width/2)+5*((sqrt((rSize*rSize)/2))+((sqrt((rSpace*rSpace)/2)))), canvas.height/2+(sqrt((rSize*rSize)/2)));
    canvas.rotate((3*PI)/4);  //rotates rectangles
    canvas.fill(255);
    for (int i = 0; i < 6; i++) {
      for(int j = 0; j < i; j++){
        canvas.rect(i*(rSize+rIncrease), j*(rSize+rIncrease), rSize, rSize); 
      }
    }
    canvas.popMatrix();
  canvas.endDraw();
  
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  
  //canvas.save("grab.png");
}

/*  Calculate resizing
_________________________________________________________________ */

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
