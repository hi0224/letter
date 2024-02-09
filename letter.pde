float basex = 10;
float basey = 30;
float baseH = 100;
float armWx = 10;
float armWy = 100;
float armWH = 400;
float armLy = 120;
float armLH = 300;

float handx = 10;
float handy = 80;
float handH = 200;

float t1 = 0;
float t2= 150;
float t3 = -100;

float angle0 = 0;
float angle1 = 60;
float angle2 = -30;
float angle3 = 15;

float angle00 = 0;
float angle11 = -60;
float angle22 = 30;
float angle33 = -15;

float dif0 = 0.8;
float dif1 = 0.8;
float dif2 = 0.8;
float dif3 = 0.5;
float dif4 = 0.4;

MouseCamera mouseCamera;
void setup() {
  size(1000,1000,P3D);
  mouseCamera = new MouseCamera(800.0, 0, 0, (height/2.0)/tan(PI*30.0/180.0), 0, 0, 0, 0, 1, 0); // MouseCameraの生成
  draw();
}

void draw() {

  mouseCamera.update(); 
  background(255);
  lights();  

pushMatrix();
  translate(width/2, height/2,0);
  translate(11,-150,100);
 beginShape();
  fill(#D8A36D);  
  vertex(0,0,0);
  vertex(0,300,0);
  vertex(t1,t2,t3);
 endShape(CLOSE);
popMatrix();
   
  translate(width/2, height/2);     
  fill(222,184,135);
  strokeWeight(0.001); 
  stroke(222, 184, 135);
  box(20, 300, 200); 
  
 if(keyPressed){
   
   if(key == 'o'){
    t1=10;
    t2=100;
    t3=150;
    }
      if(key == 'O'){
    t1=0;
    t2=150;
    t3=-100;
    }
    //rotate base
    if(key == 'a'){
      if(angle0 <= 60 ){
      angle0 = angle0 + dif0;
      }
      if(angle00 >= -60 ){
      angle00 = angle00 - dif0;
    }
    }
    
    if(key == 'A'){
      if(angle0 >= -60 ){
      angle0 = angle0 - dif0;
      }
      if(angle00 <= 60 ){
      angle00 = angle00 + dif0;
    }
    }
    
    //rotate arm1
    if(key == 'b'){
      if(angle1 <= 160 ){
        angle1 = angle1 + dif1;
      }
      if(angle11 >= -160 ){
        angle11 = angle11 - dif1;
      }
    }
    
    if(key == 'B'){
      if(angle1 >= 20 ){
        angle1 = angle1 - dif1;
      }
      if(angle11 <= -20 ){
        angle11 = angle11 + dif1;
      }
    }
    
    
    //rotate arm2
    if(key == 'c'){
      if(angle2 >= -120 ){
      angle2 = angle2 - dif2;
      }
      if(angle22 <= 120 ){
      angle22 = angle22 + dif2;
      }
    }
    
    if(key == 'C'){
      if(angle2 <= 0 ){
      angle2 = angle2 + dif2;
      }
      if(angle22 >= 0 ){
      angle22 = angle22 - dif2;
      }
    }
    
    //rotate arm3
    if(key == 'd'){
      if(angle3 >= -50 ){
      angle3 = angle3 + dif3;
      }      
      if(angle33 <= 50 ){
      angle33 = angle33 - dif3;
      }
    }
    
    if(key == 'D'){
      if(angle3 <= 0 ){
      angle3 = angle3 - dif3;
      }
      if(angle33 >= 0 ){
      angle33 = angle33 + dif3;
      }
    }
    
        
  
    if (key == 'e'){
      if(angle0 >=0 ){
        angle0 = angle0 - dif4;
        }else{
        angle0 = angle0 + dif4;
        } 
      if(angle1 >=0 ){
        angle1 = angle1 - dif4;
        }else{
        angle1 = angle1 + dif4;
        } 
      if(angle2 >=0 ){
        angle2 = angle2 - dif4;
        }else{
        angle2 = angle2 + dif4;
        } 
      if(angle0 >=0 ){
        angle3 = angle3 + dif4;
        }else{
        angle3 = angle3 - dif4;
        
        }
        
      if(angle00 >=0 ){
        angle00 = angle00 - dif4;
        }else{
        angle00 = angle00 + dif4;
        } 
      if(angle11 >=0 ){
        angle11 = angle11 - dif4;
        }else{
        angle11 = angle11 + dif4;
        } 
      if(angle22 >=0 ){
        angle22 = angle22 - dif4;
        }else{
        angle22 = angle22 + dif4;
        } 
      if(angle00 >=0 ){
        angle33 = angle33 + dif4;
        }else{
        angle33 = angle33 - dif4;
        } 
    }
  }
  
  pushMatrix();
  //base
  translate(0,-150,0);
  rotateZ(radians(angle0));
  translate(0,0,baseH/2);
  fill(#FFFCF2);
  box(basex,basey,baseH);

  //1st link
  translate(0,0,baseH/2-armLy/2);
  rotateX(radians(angle1));
  translate(0,0,armWH/2-armLy/2);
  box(armWx,armLy,armWH);
 
 //2nd link
  translate(0,0,armWH/2-armWy/2);
  rotateX(radians(-angle2));
  translate(0,0,armLH/2-armWy/2);
  box(armWx,armWy,armLH);
  
   //3nd link
  translate(0,0,armLH/2-handy/2);
  rotateX(radians(angle3));
  translate(0,0,handH/2-handy/2);
  box(handx,handy,handH);
  
 popMatrix();
  
 pushMatrix();
 
  //base
  translate(0,150,0);
  rotateZ(radians(angle00));
  translate(0,0,baseH/2);
  fill(#FFFCF2);
  box(basex,basey,baseH);

  //1st link
  translate(0,0,baseH/2-armLy/2);
  rotateX(radians(angle11));
  translate(0,0,armWH/2-armLy/2);
  box(armWx,armLy,armWH);
 
 //2nd link
  translate(0,0,armWH/2-armWy/2);
  rotateX(radians(-angle22));
  translate(0,0,armLH/2-armWy/2);
  box(armWx,armWy,armLH);
  
   //3nd link
  translate(0,0,armLH/2-handy/2);
  rotateX(radians(angle33));
  translate(0,0,handH/2-handy/2);
  box(handx,handy,handH);
  
 popMatrix();
  
}



void mousePressed() {
  mouseCamera.mousePressed();
}
void mouseDragged() {
    mouseCamera.mouseDragged();
}
void mouseWheel(MouseEvent event) {
    mouseCamera.mouseWheel(event);
}
