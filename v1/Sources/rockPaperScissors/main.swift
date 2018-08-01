//imports random number function
#if os(Linux)
import Glibc
srandom(UInt32(clock()))
#else
import Foundation
#endif

// START of game

// create two players

// playerA name Adam
var playerA = Player(name : "Adam")

// playerB name Beth
var playerB = Player(name : "Beth")

// count down 1, 2, 3
print("")
print("Count down:")
for count in 1...3 {
    print("  \(count)")
    
    // generate random hand for players
    playerA.getRandomHand()
    playerB.getRandomHand()
    
    // sleep/wait for 1 second
    sleep(1)
}

// player showing hands
print("")
print("Player hands:")
print("  \(playerA.name)'s hand is \(playerA.hand)")
print("  \(playerB.name)'s hand is \(playerB.hand)")

// Calculate result
print("")
print("Result:")
var result = playerA.compareHand(opponent: playerB)
if (result == 0) {
    print("  \(playerA.name) and \(playerB.name) tie")
} else if (result > 0) {
    // playerA has better hand. Such as rock beats scissors
    print("  \(playerA.name) wins this hand.")
} else {
    // result is less than zero
    // playerB has better hand
    print("  \(playerB.name) wins this hand.")
}

