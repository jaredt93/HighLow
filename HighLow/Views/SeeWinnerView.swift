//
//  SeeWinnerView.swift
//  HighLow
//
//  Created by Jared Tamulynas on 5/15/21.
//

import SwiftUI

struct SeeWinnerView: View {
    @EnvironmentObject var game: GameData
    
    var body: some View {
        Section(header: Text("Score")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)) {
            Button(action: {
                game.calculateWinner()
                game.newGame()
                game.showingAlert = true
            }) {
                Text("TAP TO SEE WINNER")
                    .fontWeight(.bold)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 150)
            }
            .listRowBackground(Color.blue.opacity(0.15))
        }
    }
}


struct SeeWinnerView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            SeeWinnerView().environmentObject(GameData())
        }
    }
}
