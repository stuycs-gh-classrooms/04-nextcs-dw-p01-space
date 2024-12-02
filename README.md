[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tKEUpLiS)
# Project 01 For NeXT CS
### Name0: Nicaiah Pericles
### Name1: OTHER NAME HERE (delete this line if you are working solo)
---

### Overview
Your mission is create either:
- Life-like cellular automata [life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [life-like](https://en.wikipedia.org/wiki/Life-like_cellular_automaton), [demo](https://www.netlogoweb.org/launch#https://www.netlogoweb.org/assets/modelslib/Sample%20Models/Computer%20Science/Cellular%20Automata/Life.nlogo).
- Breakout/Arkanoid [demo 0](https://elgoog.im/breakout/)  [demo 1](https://www.crazygames.com/game/atari-breakout)
- Space Invaders/Arkanoid

This project will be completed in phases. The first phase will be to work on this document. Use markdown formatting. For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)


---

## Phase 0: Selection, Analysis & Plan

#### Selected Project: Space Invaders

### Necessary Features
What are the core features that your program should have? These should be things that __must__ be implemented in order to make the program useable/playable, not extra features that could be added to make the program more interesting/fun.

Player Movement, shooting function, enemy movement, game over, win, different types of enemies

### Extra Features
What are some features that are not essential to the program, but you would like to see (provided you have time after completing the necessary features. Theses can be customizations that are not part of the core requirements.

Power ups, levels

### Array Usage
How will you be using arrays in this project?

1D Array:
- Store the powerups the player has

2D Array:
- create the grid of enemies


### Controls
How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:
- Arrows: player movement
- Space: shoot
- 'r': reset
- enter: use powerup

Mouse Control:
- Mouse movement: player movement
- Mouse pressed: pause/unpause


### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes. If you are going to use classes similar to those we've made for previous assignments, you will have to add new features to them.

Ships
- Instance variables:
  - xspeed
  - yspeed
  - size
  - scolor
- METHODS
  - collisionCheck
  - level up
  - usePower
  - setSpeed
  - setColor
  - shootBullet
  - move
  - display

Powerups
- Instance variables:
  - yspeed
  - pcolor
  - Pvector (spawn cords)
- METHODS
  - setColor
  - collectedCheck
  - move
  - display
 
