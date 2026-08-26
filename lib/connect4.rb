# frozen_string_literal: true

=begin
  0) Read over the assignment requirements
  1) First lets establish our classes and their roles
      + Controller Module
        - Handles game start, turns and game end
        - Loops
      + UI Class
        - Handles all printing and prompting
        - Should only be called from controller
      + Board Class
        - Handles the game logic
        - Tracks the board state
        - Determines win
      + Player Class
        - Should have a unicode char associated (red or yellow)
        - Should also have a name associated as well
  2) Tests
      + Test UI Class
        - UI#

~~~ REMEMBER ~~~

# SOLID Principal
  + *Every class has one purpose*
  + *Software entities should be open for extension but closed for modification*
  + Functions that uses pointers/ref to base classes need to be able to process derived without knowing
  + Clients shouldn't be forced to depend on interface methods that they don't use
  + Keep high level stuff independant from the low level details
=end