// main.c

// defines
#include <Arduino.h>
#include <inttypes.h>

extern "C"
{
  void start();
  void led(byte);
  volatile uint8_t ledVal;
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
  Serial.println(ledVal, BIN);
  delay(500);
  led(0);
  Serial.println(ledVal, BIN);
  delay(500);
}