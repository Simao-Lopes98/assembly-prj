// main.c

// defines
#include <Arduino.h>

extern "C"
{
  void start();
  void led(byte);
}

void setup() 
{
  Serial.begin(9600);
  Serial.println("Setup");
  start();
  Serial.println("End of Setup");
}

void loop() 
{
  led(1);
  delay(500);
  led(0);
  delay(500);
}