import 'dart:io';

const List<String> validMoves = ['rock', 'paper', 'scissors'];

/// Printing the title banner and a short greeting
void printBanner() {
  print('===== ROCK, PAPER, SCISSORS =====');
  print('');
  print("Alright, let's do this! Ready to lose? Hehehe");
  print('');
}

/// Clears the screen area before Player 2 enters a move
void clearScreen() {
  for (int i = 0; i < 30; i++) {
    print('');
  }
}

/// Asks for a player's name and returns a default if none is entered
String getPlayerName(int playerNumber) {
  String label;

  if (playerNumber == 1) {
    label = 'First Player';
  } else {
    label = 'Second Player';
  }

  stdout.write('Enter $label name: ');

  String? name = stdin.readLineSync();

  if (name == null || name.trim().isEmpty) {
    print('(No name entered..Please Enter your name for "$label".)');
    return label;
  }

  return name.trim();
}
/// Checks if the move is valid input
String? validateMove(String? input) {
  if (input == null) {
    return null;
  }

  String move = input.trim().toLowerCase();

  if (validMoves.contains(move)) {
    return move;
  }

  return null;
}

/// Getting  a valid move from the player
String getMove(String playerName) {
  String? move;

  while (move == null) {
    stdout.write('$playerName, enter your move (rock/paper/scissors): ');

    String? input = stdin.readLineSync();
    move = validateMove(input);

    if (move == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  }

  return move;
}
/// Checks the two moves and returns the winning player or null if it is a draw
int? decideWinner(String moveOne, String moveTwo) {
  if (moveOne == moveTwo) {
    return null;
  }

  if (moveOne == 'rock' && moveTwo == 'scissors') {
    return 1;
  }

  if (moveOne == 'paper' && moveTwo == 'rock') {
    return 1;
  }

  if (moveOne == 'scissors' && moveTwo == 'paper') {
    return 1;
  }

  return 2;
}
/// Runs the Rock, Paper, Scissors game
void main() {
  printBanner();

  String playerOneName = getPlayerName(1);
  String playerTwoName = getPlayerName(2);

  int playerOneScore = 0;
  int playerTwoScore = 0;
  int round = 1;
  String? playAgain;

  do {
    print('');
    print('--- Round $round ---');

    String moveOne = getMove(playerOneName);

    clearScreen();

    String moveTwo = getMove(playerTwoName);

    print('');
    print('$playerOneName chose $moveOne.');
    print('$playerTwoName chose $moveTwo.');

    int? winningPlayer = decideWinner(moveOne, moveTwo);
    String? roundResult;

    if (winningPlayer == 1) {
      roundResult = '$playerOneName wins the round!';
      playerOneScore++;
    } else if (winningPlayer == 2) {
      roundResult = '$playerTwoName wins the round!';
      playerTwoScore++;
    }

    print('');
    print('Result: ${roundResult ?? "It\'s a tie!"}');

    print('');
    print('Score -> $playerOneName: $playerOneScore | '
        '$playerTwoName: $playerTwoScore');

    stdout.write('Play again? (y/n): ');
    playAgain = stdin.readLineSync()?.trim().toLowerCase();

    round++;
  } while (playAgain != 'n');

  print('');
  print('===== FINAL SCORE =====');
  print('$playerOneName: $playerOneScore | $playerTwoName: $playerTwoScore');

  String overallWinner;

  if (playerOneScore > playerTwoScore) {
    overallWinner = playerOneName;
  } else if (playerTwoScore > playerOneScore) {
    overallWinner = playerTwoName;
  } else {
    overallWinner = "It's a tie!";
  }

  print('Overall winner: $overallWinner');
}
