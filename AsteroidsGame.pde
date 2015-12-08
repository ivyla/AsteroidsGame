// bob.setdirectionX(0);

SpaceShip ship;
Star[] milkyWay = new Star[200];
//Asteroid[] roids = new Asteroid[15];
Asteroid roid = new Asteroid();
ArrayList <Asteroid> roidz;

public void setup() 
{
  size(700, 700);
  background(0);
  ship = new SpaceShip();

roidz = new ArrayList <Asteroid>();
for(int i =0; i<20; i++){
  roidz.add(new Asteroid());
}

//Asteroid roidz = new Asteroid(30);
  //for (int j = 0; j < roids.length; j++){
  
   //roids[j] = new Asteroid();
 
 // }
  
    for (int i = 0; i < milkyWay.length; i++) {
    milkyWay[i] = new Star();
  }
  
  
}
public void draw() 
{
  background(0);
  ship.show();
  ship.move();
 // System.out.println(ship.getX() + ", " + ship.getY() );
  
  roid.show();
  roid.move();

  for (int nI = 0; nI < milkyWay.length; nI++) {
    milkyWay[nI].show();
//    milkyWay[nI].move();
  }
  
 for (int pI = 0; pI < roidz.size(); pI++){
 roidz.get(pI).show();
 roidz.get(pI).move();
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip() {

    myDirectionX = 0;
    myDirectionY = 0;
    myColor = color(255);
    myCenterX = 350;
    myCenterY = 350;
    myPointDirection = 10;
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 10;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
  }
 
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return (double)myDirectionX;
  }

  public void setDirectionY(double y) {
    myDirectionY = y;
  }

  public double getDirectionY() {
    return (double)myDirectionY;
  }

  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }

  public double getPointDirection() {
    return (double)myPointDirection;
  }
  
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX > width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY > height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  { 
    //   System.out.println(corners);
//    fill(0);
//    rect(0, 0, 700, 700);   
      fill(myColor);   
 stroke(myColor);    
    //convert degrees to radians for sin and cos     
   // color(myColor);    
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
}

public void keyPressed() {
  if (keyCode== LEFT) {
    ship.rotate(-20);
  }
  if (keyCode == RIGHT) {
    ship.rotate(20);
  }
  if (keyCode == UP) {
    ship.accelerate(.50);
  }
  if (keyCode == DOWN) {
    ship.accelerate(-.50);
  }
  if(key == 'h'){
  
     ship.setX((int)(Math.random()*700));
  ship.setY((int)(Math.random()*700));
  
  ship.setDirectionX(0);
  ship.setDirectionY(0);
  
  ship.setPointDirection((int)(Math.random()*360));
  
  }
  
  
}


class Star {

  private int myX, myY;
  private int myX2, myY2;
  public int r, g, b;
  private int starColor;

  public Star() {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    r = 266;
    g = 24;
    b = 255;
    
  }

  public void show() {
    noStroke();

    fill(r,g,b);

    
    ellipse(myX, myY, 2, 2);

  }
}

class Asteroid extends Floater {

  private int rotSpeed;

  public Asteroid() {
    
        myDirectionX = (int)(Math.random()*5)-2;
    myDirectionY = (int)(Math.random()*5)-2;
    myColor = color(130,86,0);
    myCenterX = (int)(Math.random()*700);
    myCenterY = (int)(Math.random()*700);
    myPointDirection = 10;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
xCorners[0] = -11;
yCorners[0] = -8;
xCorners[1] = 7;
yCorners[1] = -8;
xCorners[2] = 13;
yCorners[2] = 0;
xCorners[3] = 6;
yCorners[3] = 10;
xCorners[4] = -11;
yCorners[4] = 8;
xCorners[5] = -5;
yCorners[5] = 0;
  rotSpeed = (int)(Math.random()*3)+1;

  }
    
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return (double)myDirectionX;
  }

  public void setDirectionY(double y) {
    myDirectionY = y;
  }

  public double getDirectionY() {
    return (double)myDirectionY;
  }

  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }

  public double getPointDirection() {
    return (double)myPointDirection;
  }
  
  public void move(){
  
  rotate(rotSpeed);
  super.move();
  }
  


}



void keyReleased(){
ship.setDirectionX(0);
ship.setDirectionY(0);
}



