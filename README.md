# Assembly Project - `assembly-prj`

## Description
This project demonstrates basic Assembly programming for the **Arduino Uno** using PlatformIO. The primary goal is to control an LED using Assembly while interacting with a C program. The project also includes a global variable to store the state of `PORTB`, which is accessible from C for debugging.

## Features
- Blinking an LED using Assembly.
- Reading and storing `PORTB` values in a global variable.
- Debugging via serial output in C.

## Repository Structure
```
assembly-prj/
│── src/
│   ├── main.c      # C code handling setup, loop, and serial debugging
│   ├── main.S      # Assembly code for LED control and `PORTB` monitoring
│── platformio.ini  # PlatformIO configuration file
│── README.md       # Project documentation
```

## Requirements
- **PlatformIO** (VS Code recommended)
- **Arduino Uno**

## Installation & Usage
1. Clone the repository:
   ```sh
   git clone https://github.com/Simao-Lopes98/assembly-prj.git
   ```
2. Open the project in **PlatformIO (VS Code)**.
3. Build and upload the code:
   ```sh
   pio run --target upload
   ```
4. Open the Serial Monitor at **9600 baud** to observe debugging messages.

## License
This project is open-source and available under the **MIT License**.

## Author
Simão Lopes

