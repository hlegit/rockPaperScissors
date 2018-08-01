//imports random number function
#if os(Linux)
import Glibc
#else
import Foundation
#endif

// An array/list of valid hands
let validHands = ["rock", "paper", "scissors"]

// Player class
//   player has a name and a current hand
//   A player can (randomly) generate a new hand
//   A player can compare his/her hand with opponent hand
class Player {
    var name: String
    var hand: String
    
    // init method
    init(name: String) {
        self.name = name
        self.hand = validHands[0]
    }
    
    // function to randomly generate a hand
    func getRandomHand() {
        var randomNumber = 0;
        
        #if os(Linux)
        randomNumber = random() % validHands.count
        #else
        let max = UInt32(validHands.count);
        randomNumber = Int(arc4random_uniform(max))
        #endif
        
        self.hand = (validHands[randomNumber]);
    }
    
    // function to compare player's hand vs his/her opponent.
    // return 1 if player wins (has better hand than opponent, rocks beats scissors)
    // return 0 if player ties (has same hand as that of opponent)
    // return -1 if player loses (has worse hand than opponent, rocks lostss to paper)
    func compareHand(opponent: Player) -> Int {
        var result = 0
        
        let opponentHand = opponent.hand
        if (hand == "rock") {
            if (opponentHand == "rock") {
                // rock vs rock, ties
                result = 0
            } else if (opponentHand == "paper") {
                // rock vs paper, loses
                result = -1
            } else if (opponentHand == "scissors") {
                // rock vs scissors, wins
                result = 1
            }
        }
        
        if (hand == "paper") {
            if (opponentHand == "paper") {
                // paper vs paper, ties
                result = 0
            } else if (opponentHand == "rock") {
                // paper vs rock, wins
                result = 1
            } else if (opponentHand == "scissors") {
                // paper vs scissors, loses
                result = -1
            }
        }
        
        if (hand == "scissors") {
            if (opponentHand == "scissors") {
                // scissors vs scissors, ties
                result = 0
            } else if (opponentHand == "rock") {
                // scissors vs rock, loses
                result = -1
            } else if (opponentHand == "paper") {
                // scissors vs paper, wins
                result = 1
            }
        }
        
        return result
    }
}
