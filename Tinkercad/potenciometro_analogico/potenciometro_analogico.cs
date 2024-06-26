// C++ code
//
float val;
float readVal;
int analogPin = A0;
int t = 200;
int red = 11;
int yel = 10;
int gre = 9;

void setup()
{
Serial.begin(9600);
  pinMode (analogPin, INPUT);
  pinMode (red, OUTPUT);
  pinMode (yel, OUTPUT);
  pinMode (gre, OUTPUT);
  
}

void loop()
{
readVal = analogRead(analogPin);
  val = (5*readVal)/1023.;
  if (val<=3.0){
 digitalWrite (gre, HIGH);
  }
  
  if (val>3.0){
    digitalWrite (gre, LOW);
  }
  
  if (val>3.0 && val<4.0){
    digitalWrite (yel, HIGH);
  }
  
  if (val<=3.0 || val>4.0){
    digitalWrite (yel, LOW);
  }
  
  if (val>4.0){
    digitalWrite (red, HIGH);
  }
  
  if (val<=4.0){
    digitalWrite (red, LOW);
  }
  
  Serial.print(val);
  Serial.println("v");
  delay (t);
  
}