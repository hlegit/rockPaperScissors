//
//  Game.swift
//  rockPaperScissorsPackageDescription
//

import Foundation

/**
 * A game of rock, paper and scissor.
 * Has two players. We will also keep track of number of wins and which player is the winner.
 */
class Game {
    // playerA
    var playerA : Player
    // number of games playerA has won
    var playerAWins: Int
    
    // playerB
    var playerB : Player
    // number of games playerB has won
    var playerBWins : Int
    
    // the winner
    var winner : Player?

    init(playerA : Player, playerB: Player) {
        self.playerA = playerA
        self.playerAWins = 0;
        
        self.playerB = playerB
        self.playerBWins = 0
        
        self.winner = nil
    }
    
    // play one round of rps
    // first we count down during which the player will figure out his/her hand (computer generated randomly)
    // Then we figure out which player won and record the result.
    func playOneRound() {
        // count down 1, 2, 3
        print("")
        print("Count down:")
        for count in 1...3 {
            print("  \(count)")
            
            // generate random hand for players
            playerA.generateHand()
            playerB.generateHand()
            
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
        let result = compareHand(playerA: playerA, playerB: playerB)
        if (result == 0) {
            print("  playerA and playerB tie")
        } else if (result > 0) {
            print("  playerA wins this hand.")
            // record result
            playerAWins = playerAWins + 1
        } else {
            print("  playerB wins this hand.")
            // record result
            playerBWins = playerBWins + 1
        }
        
        // record result so that we can figure out if there is a winner
        if (playerAWins >= 3) {
            winner = playerA;
        }
        
        if (playerBWins >= 3) {
            winner = playerB
        }
    }
    
    // return true if there is a winner
    func hasWinner() -> Bool {
        return winner != nil
    }
    
    // return the winner
    func getWinner() -> Player {
        return self.winner!
    }
    
    // function to compare player's hand vs his/her opponent.
    // return 1 if player wins
    // return 0 if player ties
    // return -1 if player loses
    func compareHand(playerA: Player, playerB: Player) -> Int {
        var result = 0

        let playerAHand = playerA.getHand()
        let playerBHand = playerB.getHand()

        if (playerAHand == "rock") {
            if (playerBHand == "rock") {
                // rock vs rock, ties
                result = 0
            } else if (playerBHand == "paper") {
                // rock vs paper, loses
                result = -1
            } else if (playerBHand == "scissors") {
                // rock vs scissors, wins
                result = 1
            }
        }
        
        if (playerAHand == "paper") {
            if (playerBHand == "paper") {
                // paper vs paper, ties
                result = 0
            } else if (playerBHand == "rock") {
                // paper vs rock, wins
                result = 1
            } else if (playerBHand == "scissors") {
                // paper vs scissors, loses
                result = -1
            }
        }
        
        if (playerAHand == "scissors") {
            if (playerBHand == "scissors") {
                // scissors vs scissors, ties
                result = 0
            } else if (playerBHand == "rock") {
                // scissors vs rock, loses
                result = -1
            } else if (playerBHand == "paper") {
                // scissors vs paper, wins
                result = 1
            }
        }
        
        return result
    }
}
