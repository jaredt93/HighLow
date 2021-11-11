//
//  GameData.swift
//  HighLow
//
//  Created by Jared Tamulynas on 5/13/21.
//

import Foundation
import SwiftUI

class GameData: ObservableObject {
    // Number of games played
    @Published var gameCount = 0
    // Player 1 selection of low or high
    @Published var player1Selection = 0 {
        didSet {
            if player1Selection == 0 {
                player1Value = 0
            } else {
                player1Value = 51
            }
        }
    }
    // Player 2 selection of low or high
    @Published var player2Selection = 0 {
        didSet {
            if player2Selection == 0 {
                player2Value = 0
            } else {
                player2Value = 51
            }
        }
    }
    // Player 1 number value
    @Published var player1Value = 0.0
    // Player 2 number value
    @Published var player2Value = 0.0
    // Player 1 score
    @Published var player1Score = 0
    // Player 2 score
    @Published var player2Score = 0
    // Player 1 locked in flag
    @Published var player1Lock = false {
        didSet {
            if player1Lock && player2Lock {
                seeWinner = true
            }
        }
    }
    // Player 2 locked in flag
    @Published var player2Lock = false {
        didSet {
            if player1Lock && player2Lock {
                seeWinner = true
            }
        }
    }
    // See winner flag
    @Published var seeWinner = false
    // See instructions flag
    @Published var seeInstructions = false
    // Current game winnings
    @Published var gameWinnings = 0.0
    // Player 1 winner flag
    @Published var player1Win = false
    // Player 2 winner flag
    @Published var player2Win = false
    
    // Game low minimum
    let lowMin = 0.0
    // Game low maximum
    let lowMax = 49.0
    // Game high minimum
    let highMin = 51.0
    // Game high maximum
    let highMax = 100.0
    // Low or High
    let choices = ["LOW", "HIGH"]
    
    // Alert title
    @Published var alertTitle = ""
    // Alert message
    @Published var alertMessage = ""
    // Showing alert boolean flag
    @Published var showingAlert = false
    
    // Starts a new game
    func newGame() {
        player1Value = 0
        player2Value = 0
        player1Selection = 0
        player2Selection = 0
        player1Lock = false
        player2Lock = false
        player1Win = false
        player2Win = false
        gameWinnings = 0
        seeWinner = false
    }
    
    // Starts a new game
    func settleUp() {
        if player1Score > player2Score {
            alertTitle = "Settle up"
            alertMessage = "Player 2 wins by \(Int(player1Score))!"
        } else if player2Score > player1Score {
            alertTitle = "Settle up"
            alertMessage = "Player 1 wins by \(Int(player2Score))!"
        } else {
            alertTitle = "Tie"
            alertMessage = "Resetting the game"
        }
        
        newGame()
        gameCount = 0
        player1Score = 0
        player2Score = 0
    }

    // Calculates the winner of the game
    func calculateWinner() {

        if player1Value <= lowMax && player2Value <= lowMax  {
            if player1Value > player2Value {
                gameWinnings = player1Value
                player1Win = true
            } else if player2Value > player1Value {
                gameWinnings = player2Value
                player2Win = true
            } else {
                gameWinnings = 0
            }
        } else if player1Value >= highMin && player2Value >= highMin {
            if player1Value < player2Value {
                gameWinnings = player1Value
                player2Win = true
            } else if player2Value < player1Value {
                gameWinnings = player2Value
                player1Win = true
            } else {
                gameWinnings = 0
            }
        } else if player1Value >= highMin && player2Value <= lowMax {
            if highMax - player1Value < player2Value {
                gameWinnings += player2Value
                player1Win = true
            } else if highMax - player1Value > player2Value {
                gameWinnings += player2Value * 2
                player2Win = true
            } else {
                gameWinnings = 0
            }
        } else if player1Value <= lowMax && player2Value >= highMin {
            if highMax - player2Value < player1Value {
                gameWinnings += player1Value
                player2Win = true
            } else if highMax - player2Value > player1Value {
                gameWinnings += player1Value * 2
                player1Win = true
            } else {
                gameWinnings = 0
            }
        }
        
        alertTitle = "Tie"
        alertMessage = "No winner could be determined"
        
        if player1Win {
            player1Score += Int(gameWinnings)
            player2Score -= Int(gameWinnings)
            alertTitle = "Winner: Player 1"
            alertMessage = "Player 1 wins \(Int(gameWinnings))"
        }
        
        if player2Win {
            player2Score += Int(gameWinnings)
            player1Score -= Int(gameWinnings)
            alertTitle = "Winner: Player 2"
            alertMessage = "Player 2 wins \(Int(gameWinnings))"
        }
        
        gameCount += 1
        showingAlert = true
    }

}
