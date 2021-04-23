//
//  PointsView.swift
//  bullseye
//
//  Created by John Jeang on 4/23/21.
//

import SwiftUI

struct PointsView: View {
  @EnvironmentObject var state: GameState
  @Binding var alertVisible: Bool
  @Binding var game: Game
  var body: some View {
    
    let score = game.points(Int(state.guess), game.target)
    
    VStack(spacing: 10){
      InstructionView(text: "The Slider's value is")
      BigNumberView(text: String(Int(state.guess)))
      BodyText(text: "You scored \(score) Points \n 🎉🎉🎉")
      Button(action: {
        withAnimation{
        alertVisible = false
          game.startNewRound(points: game.points(Int(state.guess), game.target))}
      }, label: {
        ButtonText(text: "Start New Round")
        
      })
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21.0)
    .shadow(radius: 10, x: 5.0, y: 5.0)
    
  }
}

struct PointsView_Previews: PreviewProvider {
  static private var alertVisible = Binding.constant(true)
  static private var game = Binding.constant(Game())
  static var previews: some View {
    
    
    
    
    PointsView(alertVisible: alertVisible, game: game)
      .preferredColorScheme(.dark)
      .environmentObject(GameState(50.0))
    PointsView(alertVisible: alertVisible, game: game)
      //.preferredColorScheme(.dark)
      .environmentObject(GameState(50.0))
    /*
     GameView()
     .previewLayout(.fixed(width: 568, height: 320))
     .environmentObject(GameState(50.0))
     */
  }
}
