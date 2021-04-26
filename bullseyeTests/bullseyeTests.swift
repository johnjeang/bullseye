//
//  bullseyeTests.swift
//  bullseyeTests
//
//  Created by John Jeang on 4/12/21.
//

import XCTest
@testable import bullseye

class bullseyeTests: XCTestCase {
  
  
  // Testing involves both a setup and tear down phase (self-explanatory)
  
  
  // First we make an instance.  Here Game is an optional variable but we will force unwrap it knowing the value will be there
  var game: Game?
  
  override func setUpWithError() throws {
    game = Game()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    game = nil
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testPositive(){
    let guess = game!.target + 5
    let score = game!.points(guess, game!.target)
    XCTAssertEqual(score, 95)
  }

  func testNegative(){
    let guess = game!.target - 5
    let score = game!.points(guess, game!.target)
    XCTAssertEqual(score, 95)
  }
  
  func testNewRound() {
    game!.startNewRound(points: 100)
    XCTAssertEqual(game!.score, 100)
    XCTAssertEqual(game!.round, 2)
  }
  
  func testScoreExact() {
    let guess = game!.target
    let score = game!.points(guess, game!.target)
    XCTAssertEqual(score, 200)
  }
  
  func testScoreClose() {
    let guess = game!.target + 2
    let score = game!.points(guess, game!.target)
    XCTAssertEqual(score, 98 + 50)
  }
  
  func testRestart() {
    game!.startNewRound(points: 100)
    XCTAssertNotEqual(game!.score, 0)
    XCTAssertNotEqual(game!.round, 1)
    game!.restart()
    XCTAssertEqual(game!.score, 0)
    XCTAssertEqual(game!.round, 1)
  }
  
  func testLeaderboard() {
    game!.startNewRound(points: 100)
    XCTAssertEqual(game!.leaderboardEntries.count, 1)
    XCTAssertEqual(game!.leaderboardEntries[0].score, 100)
    game!.startNewRound(points: 200)
    XCTAssertEqual(game!.leaderboardEntries.count, 2)
    XCTAssertEqual(game!.leaderboardEntries[0].score, 200)
    XCTAssertEqual(game!.leaderboardEntries[1].score, 100)
  }
  
  
}
