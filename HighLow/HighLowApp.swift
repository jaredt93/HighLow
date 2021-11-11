//
//  HighLowApp.swift
//  HighLow
//
//  Created by Jared Tamulynas on 5/12/21.
//

import SwiftUI

@main
struct HighLowApp: App {
    @StateObject var game = GameData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
