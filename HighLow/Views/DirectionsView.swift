//
//  DirectionsView.swift
//  HighLow
//
//  Created by Jared Tamulynas on 5/9/21.
//

import SwiftUI

struct DirectionsView: View {
    @EnvironmentObject var game: GameData
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Instructions")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Step 1: Players select High or Low")
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        Text("High:   51 TO 100")
                            .foregroundColor(.green)
                        Text("Low:   0 TO 49")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Step 2:")
                        .fontWeight(.bold)
                    
                    Text("Players select a number")
                    
                    Spacer()
                }
                .padding()
                
                HStack(alignment: .top) {
                    Spacer()
                    
                    VStack(spacing: 25) {
                        Text("Player 1")
                            .fontWeight(.bold)
                        
                        VStack(spacing: 5) {
                            Text("High")
                            Text("90")
                                .foregroundColor(.green)
                        }
                        
                        VStack(spacing: 5) {
                            Text("Low")
                            Text("10")
                        }
                        
                        VStack(spacing: 5) {
                            Text("High")
                            Text("85")
                        }
                        
                        VStack(spacing: 5) {
                            Text("Low")
                            Text("30")
                                .foregroundColor(.green)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 25) {
                        Text("Player 2")
                            .fontWeight(.bold)
                        
                        VStack(spacing: 5) {
                            Text("High")
                            Text("95")
                        }
                        
                        VStack(spacing: 5) {
                            Text("Low")
                            Text("25")
                                .foregroundColor(.green)
                        }
                        
                        VStack(spacing: 5) {
                            Text("Low")
                            Text("5 (5 x 2)")
                                .foregroundColor(.green)
                        }
                        
                        VStack(spacing: 5) {
                            Text("High")
                            Text("80")
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 25) {
                        Text("Winning Number")
                            .fontWeight(.bold)
                        
                        VStack(spacing: 5) {
                            Text("Lower")
                            Text("(P1 wins 90)")
                        }
                        
                        VStack(spacing: 5) {
                            Text("Higher")
                            Text("(P2 wins 25)")
                        }
                        
                        VStack(spacing: 5) {
                            Text("Closer to min/max")
                            Text("(P2 wins 10)")
                        }
                        
                        VStack(spacing: 5) {
                            Text("Closer to min/max")
                            Text("(P2 wins 30)")
                        }
                        
                    }
                    
                    Spacer()
                
                }
                .padding(.bottom)
                
                HStack {
                    Text("Step 3:")
                        .fontWeight(.bold)
                      
                    Text("Players lock in their selection")
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Step 4:")
                        .fontWeight(.bold)
                    
                    Text("Tap button to see the winner")
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Button(action: {
                    game.seeInstructions = false
                }) {
                    Text("BACK")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}


struct DirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsView()
    }
}
