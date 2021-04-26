//
//  RowView.swift
//  bullseye
//
//  Created by John Jeang on 4/23/21.
//

import SwiftUI


struct LeaderBoardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10){
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack {
            ForEach(game.leaderboardEntries.indices){ index in
              let leaderboardEntry = game.leaderboardEntries[index]
              RowView(index: index, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
    // Date() gets current date
  }
}

struct HeaderView: View {
  
  @Environment(\.verticalSizeClass) var verticalSizeClass
  
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View{
    ZStack {
      HStack {
        if(horizontalSizeClass == .compact && verticalSizeClass == .regular){
          BigBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        }
        else{
          BigBoldText(text: "Leaderboard")
        }
      }
      HStack{
        Spacer()
        Button(action: {
          leaderboardIsShowing = false
        }, label: {
          RoundedImageViewFilled(systemName:"xmark")
            .padding(.trailing)
        })
      }
    }
  }
}


struct LabelView: View {
  var body: some View {
    HStack{
      Spacer()
        .frame(width:
                Constants.General
                .roundedViewLength)
      Spacer()
      LabelText(text:"Score")
        .frame(width:
                Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width:
                Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    
  }
}



struct RowView: View {
  var index: Int
  var score: Int
  var date: Date
  var body: some View {
    HStack{
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius:.infinity)
        .strokeBorder(Color("LeaderBoardRowColor"),
                     lineWidth: Constants.General.strokeWidth)
    )
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    
    
  }
}

struct LeaderBoardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
  }
}
