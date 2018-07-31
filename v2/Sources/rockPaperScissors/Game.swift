//
//  Game.swift
//  rockPaperScissorsPackageDescription
//
//  Created by Hung Le on 7/31/18.
//

import Foundation

class Game {
    var playerA : Player
    var playerAWins: Int
    
    var playerB : Player
    var playerBWins : Int
    
    var winner : Player?

    init(playerA : Player, playerB: Player) {
        self.playerA = playerA
        self.playerAWins = 0;
        
        self.playerB = playerB
        self.playerBWins = 0
        
        self.winner = nil
    }
    
    func playOneRound() {
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
        let result = playerA.compareHand(opponent: playerB)
        if (result == 0) {
            print("  playerA and playerB tie")
        } else if (result > 0) {
            print("  playerA wins this hand.")
            playerAWins = playerAWins + 1
        } else {
            print("  playerB wins this hand.")
            playerBWins = playerBWins + 1
        }
        
        if (playerAWins >= 3) {
            winner = playerA;
        }
        
        if (playerBWins >= 3) {
            winner = playerB
        }
    }
    
    func hasWinner() -> Bool {
        return winner != nil
    }
    
    func getWinner() -> Player {
        return self.winner!
    }
}
