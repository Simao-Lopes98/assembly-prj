// main.c

// defines
#include <Arduino.h>

extern "C"
{
  void gpioStart(void);
  void serialStart(void);
  void serialPrint(char letter);
}

void setup() 
{
  gpioStart();    // GPIO Init
  serialStart();  // Serial Init
}

void loop() 
{
  serialPrint('O');
  delay(50); // Give it time to 
  serialPrint('\n');
  delay(50);
}