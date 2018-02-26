int gen_number;
int total;
int[] generated = new int[10];
int fontsize_h = 62;
int fontsize_b = 34;
int max_percentage;
float left_padding=150;
float right_padding=150;
float bottom_padding=100;
float top_padding = 100;
float text_padding;
int curve=0;

void setup(){ 
  delay(1000);
  PFont gill;
  gill = createFont("GillSansStd.otf", fontsize_h);
  smooth();
  colorMode(HSB,100); 
  size(1200,900); 
  background(100,0,0);
  frameRate(100);
  rectMode(CORNERS);
  ellipseMode(RADIUS); 
  textFont(gill);
  text_padding=(width-right_padding-left_padding)/9;
} 

int random_int(){
  int gen_number = (int) random(0,10);
  total +=1;
  delay(curve);
  if(curve>0){
  curve-=1;
  }
  return gen_number;
}

void draw(){
  max_percentage = (int((float(max(generated))/total)*100));
  generated[random_int()]+=1;
  background(100,0,0);
  
  stroke(0,0,100);
  //line(left_padding-100,height-bottom_padding-fontsize_b,width-right_padding+50,height-bottom_padding-fontsize_b);
  //line(left_padding-100,top_padding,left_padding-100,height-bottom_padding-fontsize_b);
  
  /*textAlign(RIGHT);
  text("0",left_padding-100-fontsize_b,height-bottom_padding-fontsize_b);
  text(max_percentage,left_padding-100-fontsize_b,top_padding+fontsize_b);
  
  textAlign(LEFT);
  text("%",left_padding-100-fontsize_b,top_padding+fontsize_b);
  */
  

  /*
  textAlign(LEFT);
  text(" numbers generated",width/2-3*fontsize_h,top_padding);
  */
  
  textSize(fontsize_b);
  for(int i = 0; i<generated.length;i++){
    textAlign(LEFT,BOTTOM);
    fill(0,0,100);
    text(i,left_padding+(text_padding*i)-10,top_padding);
    fill(0,0,100);
    textAlign(RIGHT);
    text((int((float(generated[i])/total)*100)),left_padding+(text_padding*i)+5,height-bottom_padding+fontsize_b);
    textAlign(LEFT);
    fill(0,0,50);
    textSize(fontsize_b-10);
    text("%",left_padding+(text_padding*i)+5,height-bottom_padding+fontsize_b);
    textSize(fontsize_b);
    float h = map((float(generated[i])/total)*100,0,(float(max(generated))/total)*100,0,height-bottom_padding-top_padding-fontsize_b*2);
    stroke(0,0,80,75);
    fill(0,0,50,75);
    noStroke();
    rect(left_padding+(text_padding*i)+fontsize_b,height-bottom_padding,left_padding+(text_padding*i)-fontsize_b,height-bottom_padding-h,100,100,0,0);
    fill(0,0,100);
  }
  
  textSize(328);
  fill(56,75,100,50);
  textAlign(CENTER,CENTER);
  text(total,width/2,height/2);
  fill(0,0,100);
}
