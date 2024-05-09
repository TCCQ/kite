# Kite

## Background

A drone is an unmanned system that can navigate land, sea, or
air. Careful combination of hardware and software can greatly benefit
the operation of the drone. We are interested in exploring software
that can manipulate a collection of hardware devices to target high
performance operation. We are particularly interested in airborne
devices.

## Goals

    - We want a drone that can perform basic aerial maneuvers
    autonomously.
        -- Takeoff
        -- Automatically hover
        -- Land

    - We want a drone that can operate manually, semi-autonomously, or
      fully autonomously.

    - The drone should be able to perform basic aerial maneuvers
      in fair-weather conditions.

    - The drone should securely emit telemetry to and execute commands from
      designated controller(s).

    - The drone should not endanger itself or any other entity it is
    aware of to the best of its ability.

### Example

    - Drone is placed in an open and empty area, powered off. It is
    powered on. It negotiates a connection to a controller. It
    recieves a command to take off. It rises to a hover a safe height
    and remains there until it recieves an instruction to land, at
    which point it makes a controlled landing, after which it can
    powered off by the controller remotely.

## Implementation

This description will proceed upwards from the lowest level, the
hardware we are using, to the highest level of abstraction, an OS on a
general purpose compute platform.

An open question is what parts and how much of the stack do we want to
implement ourselves and how much do we want to buy off the
shelf. Initially all hardware will be off the shelf. A possible a
future extension could be writing our own ESC firmware, and possibly
making our own hardware ESC designs.

### Hardware

In order to accomplish the basic goal laid out above, we need:

    - Power supply / distribution
    - Propellers
    - Motors
    - Electronic speed controller
    - Flight controller compute platform
    - Companion / general purpose compute
      -- May be overlapping with the flight controller compute?
    - Physical body, housing, and frame
    - Wireless connectivity to the controller(s)
    - Accelerometer and Gyroscope

### Open questions

    - ESC off the shelf vs homebrew
    - Flight controller implementation and relation to ECS / general compute
    - Does flight controller software reside on its own hardware
      platform or share with the general compute?
      -- If shared platform with general compute, how to share
      resources and compute time?
      -- If dedicate platform, how to communicate with the general compute?


### Operating system design

Depending on the demands on the general compute platform, we require
different things of the OS.

    - Realtime scheduler
    - Mixed priority scheduler
    - Resource sharing
    - Low overhead and fast IPC
    - Wait free Producer-consumer IO (sensor input and flight controller)
    - Resiliency and recoverablity

Multiplexing sensor input data seems like a natural desire. If and how
should sensor data be multiplexed between kernel tasks (flight
controller and telemeter for instance)?
