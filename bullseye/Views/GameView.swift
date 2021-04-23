//
//  ContentView.swift
//  bullseye
//
//  Created by John Jeang on 4/7/21.
//

import SwiftUI

// Probably can easily create an environment variable here where the guess can change and then be passed along to a results screen

// Could also make a homescreen too, so that you have to come to the game organically

struct GameView: View {
  
  @EnvironmentObject var state: GameState
  @State var game = Game()
  @State private var alertVisible: Bool = false
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack{
        InstructionsView(game: $game)
          .padding(.bottom, alertVisible ? 0 : 100)
        if alertVisible{
          PointsView(alertVisible: $alertVisible, game: $game)
            .transition(.scale)
        }
        else{
          HitMeButton(alertVisible: $alertVisible, game: $game)
            .transition(.scale)
        }

      }
      if !alertVisible{
        SliderView(text1: "1", text2: "100")
          .transition(.scale)
      }

    }
  }
}

struct InstructionsView: View{
  @Binding var game: Game
  
  var body: some View {
    VStack{
      InstructionView(text: "🎯 \n Put the bullseye as close as you can to".uppercased())
        .padding(.horizontal, 30.0)
      
      BigNumberView(text: String(game.target))
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    GameView()
      .preferredColorScheme(.dark)
      .environmentObject(GameState(50.0))
    GameView()
      //.preferredColorScheme(.dark)
      .environmentObject(GameState(50.0))
    /*
    GameView()
      .previewLayout(.fixed(width: 568, height: 320))
      .environmentObject(GameState(50.0))
 */
  }
}
