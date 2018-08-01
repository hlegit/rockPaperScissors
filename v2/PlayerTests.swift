//
//  PlayerTests.swift
//  rockPaperScissorsPackageDescription
//
//  Created by Hung Le on 7/31/18.
//

import XCTest

class PlayerTests: XCTest {
    func test01 {
        var player = Player("A good player": name)
        XCTAssertEqual("A good player", player.getName())
    }
}
