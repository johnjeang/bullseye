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
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack{
        InstructionsView(game: $game)
        HStack{
          Text("1")
            .foregroundColor(Color("TextColor"))
            .bold()
          
          Slider(value: $state.guess, in: 0.0...100.0)
          
          Text("100")
            .foregroundColor(Color("TextColor"))
            .bold()
        }
        .padding()
        Button(action:{
                alertVisible = true})
        {
          Text("Hit me!".uppercased())
            .bold()
            .font(.title3)
        }
        .padding(20.0)
        .foregroundColor(.white)
        .background(
          ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.25), Color.clear]), startPoint: .top, endPoint: .bottom)
          }
        )
        .accentColor(.black)
        .cornerRadius(21)
        .alert(isPresented: $alertVisible,
               content: {
                let guess = Int(state.guess.rounded())
                return Alert(title: Text("Boom!"), message: Text("You guessed \(Int(state.guess.rounded())) \n You scored \(game.points(guess, game.target)) points"), dismissButton:
                              .default(Text("Awesome")))
               })
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
      //.preferredColorScheme(.dark)
      .environmentObject(GameState(10.0))
    /*
    GameView()
      .previewLayout(.fixed(width: 568, height: 320))
      .environmentObject(GameState(50.0))
 */
  }
}
