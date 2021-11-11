//
//  LockedInView.swift
//  HighLow
//
//  Created by Jared Tamulynas on 5/14/21.
//

import SwiftUI

struct LockedInView: View {
    @EnvironmentObject var game: GameData
    var player = ""
    
    var body: some View {
        Section(header: Text("\(player)")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)) {
            VStack {
                Text("\(player) is ready")
                    .fontWeight(.bold)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 100)
                
                Button(action: {
                    game.newGame()
                }) {
                    Text("RESET")
                        .fontWeight(.bold)
                        .padding(.bottom)
                }
            }
        }
    }
}


struct LockedInView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            LockedInView(player: "Player 1")
        }
    }
}
