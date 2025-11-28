//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import Foundation

struct GameLogic {
    
    // All possible winning combinations
    static let winPatterns: [[Int]] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
        [0, 4, 8], [2, 4, 6]             // Diagonals
    ]
    
    // Check if there's a winner
    static func checkWinner(in squares: [GameSquare]) -> (winner: Player?, winningIndices: [Int]) {
        for pattern in winPatterns {
            let square1 = squares[pattern[0]]
            let square2 = squares[pattern[1]]
            let square3 = squares[pattern[2]]
            
            if let player = square1.player,
               player == square2.player,
               player == square3.player {
                return (player, pattern)
            }
        }
        return (nil, [])
    }
    
    // Check if the game is a draw
    static func checkDraw(in squares: [GameSquare]) -> Bool {
        return squares.allSatisfy { $0.player != nil }
    }
}