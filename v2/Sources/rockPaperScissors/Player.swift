//
//  Player.swift
//  rockPaperScissorsPackageDescription
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

    // player name
    var name: String
    
    // current hand (from validHands)
    var hand: String
    
    // init method
    init(name: String) {
        self.name = name
        self.hand = validHands[0]
    }
    
    // generate a random number
    func getRandomNumber() -> Int {
        var randomNumber = 0;
        #if os(Linux)
        randomNumber = random() % validHands.count
        #else
        let max = UInt32(validHands.count);
        randomNumber = Int(arc4random_uniform(max))
        #endif
        return randomNumber
    }
    
    // function to randomly generate a hand
    func generateHand() {
        let randomNumber = getRandomNumber()
        self.hand = (validHands[randomNumber]);
    }
    
    // return the user current hand
    func getHand() -> String {
        return self.hand
    }
    
    // return the user name
    func getName() -> String {
        return self.name;
    }
}
