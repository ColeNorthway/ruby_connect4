# frozen_string_literal: true

=begin
  0) Read over the assignment requirements
  1) First lets establish our classes and their roles
      + UI Class
        - Handles all printing and prompting
        - Should only be called from controller
      + Board Class
        - Handles the game logic
        - Tracks the board state
        - Determines win
      + Controller Class
        - Handles game start, turns and game end
        - Loops
      + Player Class
        - Should have a unicode char associated (red or yellow)
        - Should also have a name associated as well
  2) Tests
      + Test Player
        - Player#init
          - Returns nil
          - The unicode char and the name != nil
      + Test Controller
        - Controller#play
          - Entry
          - Should return nil
        - Controller#init
          - Returns two players
          - Prompts for player info

~~~ REMEMBER ~~~

# SOLID Principal
  + *Every class has one purpose*
  + *Software entities should be open for extension but closed for modification*
  + Functions that uses pointers/ref to base classes need to be able to process derived without knowing
  + Clients shouldn't be forced to depend on interface methods that they don't use
  + Keep high level stuff independant from the low level details
=end