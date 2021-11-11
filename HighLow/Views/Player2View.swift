//
//  Player2View.swift
//  HighLow
//
//  Created by Jared Tamulynas on 5/12/21.
//

import SwiftUI

struct Player2View: View {
    @EnvironmentObject var game: GameData

    var body: some View {
        Section(header: Text("Player 2")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)) {
            VStack {
                Picker("Low or High", selection: $game.player2Selection) {
                    ForEach(0 ..< game.choices.count, id: \.self) {
                        Text("\(game.choices[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                Slider(value: $game.player2Value, in: game.player2Selection == 0 ? game.lowMin...game.lowMax : game.highMin...game.highMax, step: 1)
                    .padding(.vertical)
                    .accentColor(game.player2Selection == 0 ? .red : .green)
                    
                ZStack {
                    Text("\(game.player2Value, specifier: "%g")")
                        .font(.title3)
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(lineWidth: 1.5)
                        .frame(width: 40, height: 40)
                }
                
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("You will win if:")
                        .fontWeight(.bold)
                        .padding(.top)
                        
                    HStack {
                        if game.player2Selection == 0 {
                            if game.player2Value != game.lowMin {
                                Text("Player 1 goes low and is <")
                                Text("\(game.player2Value, specifier: "%g")")
                            }
                            
                        } else {
                            if game.player2Value != game.highMin {
                                Text("Player 1 goes low and is >")
                                Text("\(game.highMax - game.player2Value, specifier: "%g")")
                            }
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        if game.player2Selection == 1 {
                            if game.player2Value != game.highMax {
                                Text("Player 1 goes high and is >")
                                Text("\(game.player2Value, specifier: "%g")")
                            }
                        } else {
                            if game.player2Value != game.lowMax {
                                Text("Player 1 goes high and is <")
                                Text("\(game.highMax - game.player2Value, specifier: "%g")")
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Button(action: {
                game.player2Lock = true
            }) {
                Text("LOCK IT IN")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct Player2View_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            Player2View().environmentObject(GameData())
        }
    }
}
