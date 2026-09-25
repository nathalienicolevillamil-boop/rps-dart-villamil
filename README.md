# Two-Player Rock, Paper, Scissors

## Name
Nathalie Nicole Villamil

## Section
BSIT 3A-ILFV3

## Description
This is a simple two-player Rock, Paper, Scissors game created in Dart. It allows two players to choose their moves, shows the winner, and keeps track of the score.

When the program starts, it shows a title banner then asks for Player 1's
name and Player 2's name (a default name is used if a player leaves it
blank). For each round, Player 1 is asked to enter a move first
(rock, paper, or scissors). After Player 1 enters a move, the screen is
cleared with several blank lines so Player 2 cannot see it. Player 2 is
then asked for their move. If an invalid move is typed, the game keeps
asking again until a valid one is entered.

Once both moves are in, the game shows what each player chose, decides
the winner of the round (or declares a draw), and displays the updated
score. The players are then asked if they want to play again (y/n).
This repeats until they choose to stop, at which point the game shows
the final score and announces the overall winner.

## How to Run

1. Open the project folder in the terminal.
2. Run this command:

   dart rock_paper_scissors.dart
