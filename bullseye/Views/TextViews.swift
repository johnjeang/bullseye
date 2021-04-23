//
//  TextViews.swift
//  bullseye
//
//  Created by John Jeang on 4/21/21.
//

import SwiftUI

struct InstructionView: View {
  var text: String
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .kerning(2.0)
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
  }
}

struct BigNumberView: View{
  var text: String
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
  }
}

struct SliderTextView: View{
  var text: String
  var body: some View{
    Text(text)
      .foregroundColor(Color("TextColor"))
      .bold()
  }
}


struct SliderView: View{
  var text1: String
  var text2: String
  @EnvironmentObject var state: GameState
  var body: some View{
    HStack{
      SliderTextView(text: text1)
        .frame(width: 35)
      Slider(value: $state.guess, in: 0.0...100.0)
      SliderTextView(text: text2)
        .frame(width: 35)
    }
    .padding()
    
  }
}

struct HitMeButton: View{
  @Binding var alertVisible: Bool
  @Binding var game: Game
  @EnvironmentObject var state: GameState
  
  var body: some View{
    Button(action:{
      withAnimation{
        alertVisible = true}
    })
    
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
    .overlay(
      RoundedRectangle(cornerRadius: 21.0)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
    
    
    
    
    /*
     Default Apple alert
     
    .alert(isPresented: $alertVisible,
           content: {
            let guess = Int(state.guess.rounded())
            return Alert(title: Text("Pow!"), message: Text("You guessed \(Int(state.guess.rounded())) \n You scored \(game.points(guess, game.target)) points"), dismissButton:
                          .default(Text("Awesome")){
                            game.startNewRound(points: game.points(guess, game.target))
                            
                          })
            // Maybe add to score and round here?
           })
 */
    
  }
  
}

struct LabelText: View{
  var text: String
  var body: some View{
    Text(text)
      .kerning(1.5)
      .foregroundColor(Color("TextColor"))
      .font(.caption)
      .bold()
  }
}

struct BodyText: View{
  var text: String
  var body: some View{
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }
}


struct ButtonText: View{
  var text: String
  var body: some View{
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor)
      .cornerRadius(12)
      .foregroundColor(.white)
      }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionView(text: "Instructions")
      BigNumberView(text: "99")
      BodyText(text: "You scored 200 points \n 🎉🎉🎉")
      ButtonText(text: "And you should be proud")
        .padding()
    }
  }
}
