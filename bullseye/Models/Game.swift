//
//  Game.swift
//  bullseye
//
//  Created by John Jeang on 4/12/21.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}




struct Game{
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  func points(_ sliderValue: Int, _ target: Int) -> Int{
    let basic_score = 100 - abs(sliderValue - target)
    if basic_score == 100{
      return basic_score + 100
    }
    else if basic_score > 97{
      return basic_score + 50
    }
    else{
      return basic_score
    }
  }
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...100)
    leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
    leaderboardEntries.sort { $0.score > $1.score }
  }
  
  mutating func restart(){
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
  
  
  
  
}
