// C++ code
//
int redPin = 13;
int yelPin = 9;
int t = 500;
int red = 5;
int yel = 3;
int i;
  
void setup()
{
pinMode (red, OUTPUT);
  pinMode (yel, OUTPUT);
}

void loop()
{
 for (i = 1; i <= yel; i = i + 1){
  digitalWrite (yelPin, HIGH);
  delay (t);
  digitalWrite (yelPin, LOW);
  delay (t);
 }
  for (i = 1; i <= red; i++){
  digitalWrite (redPin, HIGH);
  delay (t);
  digitalWrite (redPin, LOW);
  delay (t);
 }
}