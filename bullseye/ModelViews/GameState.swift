//
//  GameState.swift
//  bullseye
//
//  Created by John Jeang on 4/9/21.
//

import Foundation

class GameState: ObservableObject{
  @Published var currentTab :String? = nil
  var guess: Double
  
  init(_ guess: Double){
    self.guess = guess
  }
  
  
}
