<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project uses the on-board 8-switch on the development board to choose between 8 different modes. 
All modes display on the built-in 7-segment display on the development board. The modes are as follows:

MODE 0/1 - CLOCKWISE/COUNTERCLOCKWISE ANIMATION
Simple clockwise or counterclockwise animation

MODE 2 - COUNTING 0-9
Counts from 0, 1, ..., 9 and back to 0 again with a frequency of 1Hz. 

MODE 3 - HELLO WORLD
Displays a simple H E L L O _ W O R L D _ . _ . message with a frequency of 2Hz. 

MODE 4 - DICE
Each time this switch is flipped, a random number between 1-6 is displayed, like a six-sided die. 

MODE 5 - SEQUENCE REPLAY
Initially the display just blinks a dash with a frequency of 2Hz, awaiting input. Here a 4-button module must be
connected to the input PMOD at pins 0-3 (and VCC, GND of course). 10 buttons must be pressed, and then the display will 
replay the pressed buttons in order (buttons are called by numbers 1-4). 

MODE 6 - PULSING LIGHT
Simple effect using PWM that varies the brightness on the 7-seg display up and down. 

MODE 7 - HAMMING WEIGHT
Displays how many of the lower indexed switches are turned on (0-7)

EXTRA - CENTURY CHECKER
This is not a mode, but is always running. Using clock dividers, the chip will, after exactly 100 years, turn on io_uio_out[7], 
which should be connected to an LED anode. Thus after 100 years the LED will light up. 

![explanation](https://github.com/user-attachments/assets/9004c77a-52a7-4e89-9562-7ccc337f6302)

## How to test
The MSB switch (most to the left) should be prioritized over the ones more to the right. Meaning mode 7 - hamming weight 
should override any other modes, mode 6 - pulsing light should override all other modes except mode 7 and so on. 

## External hardware

Only a 4-button module is needed for mode 5 - sequence replay. 
