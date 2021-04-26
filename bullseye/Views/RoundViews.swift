//
//  RoundViews.swift
//  bullseye
//
//  Created by John Jeang on 4/21/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
      Circle()
        .strokeBorder(Color("ButtonStrokeColor"),
                      lineWidth: Constants.General.strokeWidth)
      )

  }
}




struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .background(
      Circle()
        .fill(Color("ButtonFilledColor"))
      )

  }
}

struct RoundRectTextView: View{
  var text: String
  var body: some View{
    
    Text(text)
      .bold()
      .font(.title3)
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
    )
  }
}

struct RoundedTextView: View {
  var text: String
  var body: some View{
    Text(text)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.Leaderboard.leaderboardScoreColWidth, height: Constants.Leaderboard.leaderboardScoreColWidth)
      .overlay(
        Circle()
          .strokeBorder(Color("LeaderBoardRowColor"),
                        lineWidth: Constants.General.strokeWidth)

      )
  }
}


struct PreviewView: View {
  var body: some View{
    VStack(spacing: 10.0) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      LabelText(text: "score")
      RoundRectTextView(text: "0")
      RoundedTextView(text: "1")
    }
  }
}








struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
