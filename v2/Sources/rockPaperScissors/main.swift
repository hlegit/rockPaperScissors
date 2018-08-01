#if os(Linux)
import Glibc
srandom(UInt32(clock()))
#else
//imports random number function
import Foundation
#endif

// instantiate two players
var playerA = Player(name : "Adam")
var playerB = Player(name : "Beth")

var game = Game(playerA: playerA, playerB: playerB)

var winner = game.playUntilThereIsAWinner()

print("")
print("Winner is \(winner.getName())")

