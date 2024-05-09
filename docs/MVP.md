# Minimum viable product

This describes what we need for the minimum viable product. The MVP is
the simple hovering and landing example given in the central design document.

## Hardware

    - Power distribution modules ?
    - Propellers ?
    - Brushless Motors ?
    - ESC (4-in-1)
      -- Hardware ?
      -- Firmware ? (BLHeli vs AM32)
    - Frame ?
    - General purpose compute (raspi4b)
    - gyro and accel sensors (STEMMA QT / Qwiic (adafruit)?)

## Software

    - Combined flight controller and RTOS
      -- On pi4
      -- ARM boot process (early boot setup, virtual memory setup)
    - Kernel memory map
    - Bootstrap device handlers and debug utilities
