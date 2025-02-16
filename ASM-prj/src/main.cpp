// main.c

// defines
#include <Arduino.h>

extern "C"
{
  void gpioStart(void);
  void serialStart(void);
}

void setup() 
{
  gpioStart();    // GPIO Init
  serialStart();  // Serial Init
}

void loop() 
{
  Serial.println("Hi good morning");
  delay(1000);
}