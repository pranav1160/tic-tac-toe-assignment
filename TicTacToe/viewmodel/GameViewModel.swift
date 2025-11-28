//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import SwiftUI
internal import Combine

@MainActor
class GameViewModel: ObservableObject {
    
    @Published var squares: [GameSquare] = []
    @Published var currentPlayer: Player = .x
    @Published var winner: Player? = nil
    @Published var isDraw: Bool = false
    @Published var winningIndices: [Int] = []
    
    var gameOver: Bool {
        winner != nil || isDraw
    }
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        squares = (0..<Constants.totalSquares).map { GameSquare(id: $0) }
        currentPlayer = .x
        winner = nil
        isDraw = false
        winningIndices = []
    }
    
    func makeMove(at index: Int) {
        guard !gameOver, squares[index].player == nil else { return }
        
        // Make the move
        squares[index].player = currentPlayer
        
        // Check for winner
        let result = GameLogic.checkWinner(in: squares)
        if let winningPlayer = result.winner {
            winner = winningPlayer
            winningIndices = result.winningIndices
            return
        }
        
        // Check for draw
        if GameLogic.checkDraw(in: squares) {
            isDraw = true
            return
        }
        
        // Switch player
        currentPlayer = currentPlayer.next()
    }
}
