# The Algorithm

Squares on a plane are colored variously either black or white. We arbitrarily identify one square as the "ant". The ant can travel in any of the four cardinal directions at each step it takes. The "ant" moves according to the rules below:

* At a white square, turn 90° right, flip the color of the square, move forward one unit
* At a black square, turn 90° left, flip the color of the square, move forward one unit

[Wikipedia's entry](https://en.wikipedia.org/wiki/Langton's_ant)

# How to run

Use e.g.

`elm-reactor` and open `Ant.elm`

# TODO 
 
- [ ] periodic boundaries
- [ ] tidy up code, some obvious duplication which could be removed
