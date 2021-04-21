//
//  bullseyeApp.swift
//  bullseye
//
//  Created by John Jeang on 4/7/21.
//

import SwiftUI

@main
struct bullseyeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
              .environmentObject(GameState(50.0))
        }
    }
}
