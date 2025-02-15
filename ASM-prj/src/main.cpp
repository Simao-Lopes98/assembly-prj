// main.c

// defines
#include <Arduino.h>
#include <inttypes.h>

extern "C"
{
  void start();
  void led(byte);
  volatile uint8_t ledVal = 1;
}

void setup() 
{
  Serial.begin(9600);
  Serial.println("Setup");
  start();
  delay(1000);
  Serial.println("End of Setup");
}

void loop() 
{
  led(1);
  Serial.println(ledVal);
  delay(500);
  led(0);
  Serial.println(ledVal);
  delay(500);
}