#if os(Linux)
import Glibc
srandom(UInt32(clock()))
#else
//imports random number function
import Foundation
#endif

// instantiate two players
var playerA = Player(name : "playerA")
var playerB = Player(name : "playerB")

var game = Game(playerA: playerA, playerB: playerB)
var hasWinner = false

var gameNumber = 0;
while(hasWinner == false) {
    gameNumber = gameNumber + 1;
    
    print("")
    print("### Playing game #\(gameNumber)")
    game.playOneRound()
    hasWinner = game.hasWinner()
}

print("")
print("Winner is \(game.getWinner().getName())")
print("Played total of \(gameNumber) games")

