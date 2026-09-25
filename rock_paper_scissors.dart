import 'dart:io';

const List<String> validMoves = ['rock', 'paper', 'scissors'];

/// Prints the title banner and a short greeting.
void printBanner() {
  print('===== ROCK, PAPER, SCISSORS =====');
  print('');
  print("Alright, let's do this! Ready to lose? Hehehe");
  print('');
}

/// Prints 30 blank lines to hide the previous player's move.
void clearScreen() {
  for (int i = 0; i < 30; i++) {
    print('');
  }
}

/// Asks for a player's name and returns a default if none is entered.
String getPlayerName(int playerNumber) {
  String label = playerNumber == 1 ? 'First Player' : 'Second Player';
  stdout.write('Enter $label name: ');
  String? name = stdin.readLineSync()?.trim();
  if (name == null || name.isEmpty) {
    print('(No name entered. Using "$label".)');
    return label;
  }
  return name;
}

/// Validates a move and returns it in lowercase, or null if invalid.
String? validateMove(String? input) {
  String? move = input?.trim().toLowerCase();
  return validMoves.contains(move) ? move : null;
}

/// Keeps asking a player until a valid move is entered.
String getMove(String playerName) {
  String? move;
  while (move == null) {
    stdout.write('$playerName, enter your move (rock/paper/scissors): ');
    move = validateMove(stdin.readLineSync());
    if (move == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  }
  return move;
}

/// Compares both moves and returns 1 if player one wins, 2 if player two
/// wins, or null if the round is a draw.
int? decideWinner(String moveOne, String moveTwo) {
  if (moveOne == moveTwo) {
    return null;
  } else if ((moveOne == 'rock' && moveTwo == 'scissors') ||
      (moveOne == 'paper' && moveTwo == 'rock') ||
      (moveOne == 'scissors' && moveTwo == 'paper')) {
    return 1;
  } else {
    return 2;
  }
}

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
    print('$playerOneName chose $moveOne. $playerTwoName chose $moveTwo.');

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
    print('Result: ${roundResult ?? "It's a tie!"}');

    print('');
    print('Score -> $playerOneName: $playerOneScore | $playerTwoName: $playerTwoScore');
    stdout.write('');
    stdout.write('Play again? (y/n): ');
    playAgain = (stdin.readLineSync()?.trim().toLowerCase()) ?? '';
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