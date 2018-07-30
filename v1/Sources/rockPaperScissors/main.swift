#if os(Linux)
import Glibc
srandom(UInt32(clock()))
#endif

// An array/list of valid hands
let validHands = ["rock", "paper", "scissors"]

// Player class
//   player has a name and a current hand
class Player {
  var name: String
  var hand: String

  // init method
  init(name: String) {
    self.name = name
    self.hand = validHands[0]
  }

  // function to randomly generate a hand 
  func count123() {
    self.hand = (validHands[random() % validHands.count]);
  }

  // return the user current hand
  func getHand() -> String {
    return self.hand
  }

  // function to compare player's hand vs his/her opponent.
  // return 1 if player wins
  // return 0 if player ties
  // return -1 if player loses
  func compareHand(opponent: Player) -> Int {
    var result = 0

    if (hand == "rock") {
      if (opponent.getHand() == "rock") {
        // rock vs rock, ties
        result = 0
      } else if (opponent.getHand() == "paper") {
        // rock vs paper, loses
        result = -1
      } else if (opponent.getHand() == "scissors") {
        // rock vs scissors, wins
        result = 1
      }
    }

    if (hand == "paper") {
      if (opponent.getHand() == "paper") {
        // paper vs paper, ties
        result = 0
      } else if (opponent.getHand() == "rock") {
        // paper vs rock, wins
        result = 1
      } else if (opponent.getHand() == "scissors") {
        // paper vs scissors, loses 
        result = -1
      }
    }

    if (hand == "scissors") {
      if (opponent.getHand() == "scissors") {
        // scissors vs scissors, ties
        result = 0
      } else if (opponent.getHand() == "rock") {
        // scissors vs rock, loses 
        result = -1
      } else if (opponent.getHand() == "paper") {
        // scissors vs paper, wins
        result = 1
      }
    }

    return result 
  }
}

// instantiate two players
var playerA = Player(name : "playerA")
var playerB = Player(name : "playerB")

// count down 1, 2, 3
print("")
print("Count down:")
for count in 1...3 {
  print("  \(count)")

  // generate random hand for players
  playerA.count123()
  playerB.count123()

  sleep(1)
}


// player showing hands
print("")
print("Player hands:")
print("  \(playerA.name) hand is \(playerA.getHand())")
print("  \(playerB.name) hand is \(playerB.getHand())")

// Calculate result
print("")
print("Result:")
var result = playerA.compareHand(opponent: playerB)
if (result == 0) {
  print("  playerA and playerB tie")
} else if (result > 0) {
  print("  playerA wins this hand.")
} else {
  print("  playerB wins this hand.")
}

