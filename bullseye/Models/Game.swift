//
//  Game.swift
//  bullseye
//
//  Created by John Jeang on 4/12/21.
//

import Foundation

struct Game{
  var target = Int.random(in: 1...100)
  
  func points(_ sliderValue: Int, _ target: Int) -> Int{
    return 100 - abs(sliderValue - target)
  }
}
