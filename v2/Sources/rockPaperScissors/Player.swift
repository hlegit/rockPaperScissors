//
//  Player.swift
//  rockPaperScissorsPackageDescription
//
//  Created by Hung Le on 7/31/18.
//

#if os(Linux)
import Glibc
#else
//imports random number function
import Foundation
#endif

// Player class
//   player has a name and a current hand
class Player {
    // An array/list of valid hands
    let validHands = ["rock", "paper", "scissors"]

    var name: String
    var hand: String
    
    // init method
    init(name: String) {
        self.name = name
        self.hand = validHands[0]
    }
    
    // function to randomly generate a hand
    func count123() {
        var randomNumber = 0;
        #if os(Linux)
        randomNumber = random() % validHands.count
        #else
        let max = UInt32(validHands.count);
        randomNumber = Int(arc4random_uniform(max))
        #endif
        self.hand = (validHands[randomNumber]);
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
    
    func getName() -> String {
        return name;
    }
}
