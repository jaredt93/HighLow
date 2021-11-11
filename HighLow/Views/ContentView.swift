//
//  ContentView.swift
//  HighLow is a game of chance and strategy
//
//  Created by Jared Tamulynas on 12/8/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var game: GameData
    
    var body: some View {
        ZStack {
            GameView()
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameData())
    }
}
