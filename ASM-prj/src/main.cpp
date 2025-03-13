// main.c

// defines
#include <Arduino.h>

extern "C"
{
  void ledInit(uint8_t pin);
  void btnInit(uint8_t pin);
  void intrInit(uint8_t pin);

  void ledState(uint8_t state);
}

void setup() 
{
  ledInit(0U);
}

void loop() 
{
  ledState(1);
  delay(500);
  ledState(0U);
  delay(500);
}