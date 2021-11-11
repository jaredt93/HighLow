//
//  ScoreView.swift
//  ScoreView contains the current score and directions for the game
//
//  Created by Jared Tamulynas on 5/12/21.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var game: GameData
    
    var body: some View {
        Section(header: Text("Score")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)) {
            VStack {
                HStack {
                    Text("HighLow")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        
                    Button(action: {
                        game.seeInstructions = true
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title2)
                    }
                        .buttonStyle(BorderlessButtonStyle())
                }
                .padding(.top)
                    
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("Player 1")
                            .fontWeight(.bold)
                        
                        Text("\(game.player1Score <= 0 ? "" : "+")" + "\(game.player1Score)")
                            .padding(.top)
                    }
                    .foregroundColor(game.player1Score < 0 ? .red : game.player1Score > 0 ? .green : .primary)
                    .padding(.trailing, 25)
                    
                    Spacer()
                    
                    VStack {
                        Text("Player 2")
                            .fontWeight(.bold)
                        
                        Text("\(game.player2Score <= 0 ? "" : "+")" + "\(game.player2Score)")
                            .padding(.top)
                    }
                    .foregroundColor(game.player2Score < 0 ? .red : game.player2Score > 0 ? .green : .primary)
                    .padding(.leading, 25)
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Games Played: ")
                        .fontWeight(.bold)
                    
                    Text("\(game.gameCount)")
                }
                .padding(.bottom)
            }
            
            Button(action: {
                game.settleUp()
                game.showingAlert = true
            }) {
                Text("SETTLE UP")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            } 
        }
    }
}


struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ScoreView().environmentObject(GameData())
        }
    }
}
