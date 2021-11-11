//
//  GameView.swift
//  HighLow
//
//  Created by Jared Tamulynas on 5/9/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: GameData
    
    var body: some View {
        Form {
            Group {
                if game.player1Lock {
                    LockedInView(player: "Player 1")
                } else {
                    Player1View()
                }
            }
             
            Group {
                if game.seeWinner {
                    SeeWinnerView()
                } else {
                    ScoreView()
                }
            }
            
            Group {
                if game.player2Lock {
                    LockedInView(player: "Player 2")
                } else {
                    Player2View()
                }
            }
        }
        .alert(isPresented: $game.showingAlert) {
            Alert(title: Text(game.alertTitle), message: Text(game.alertMessage), dismissButton: .default(Text("Continue")))
        }
        .sheet(isPresented: $game.seeInstructions) {
            DirectionsView()
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(GameData())
    }
}
