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
  
  
}
