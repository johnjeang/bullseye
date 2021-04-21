//
//  HomeView.swift
//  bullseye
//
//  Created by John Jeang on 4/9/21.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var state: GameState
    var body: some View {
      NavigationView{
        VStack{
          Text("The Bullseye Game")
          NavigationLink(
            destination: GameView(),
            tag: "Game",
            selection: $state.currentTab,
            label: {
              Text("Start Game")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle()) // not really needed
      }
      

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
          .environmentObject(GameState(50.0))
    }
}
