//
//  Constants.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import SwiftUI

struct Constants {
    
    // Grid
    static let gridSize = 3
    static let totalSquares = gridSize * gridSize
    static let gridSpacing: CGFloat = 12
    static let squareCornerRadius: CGFloat = 16
    
    // Colors
    static let backgroundColor = Color(red: 0.1, green: 0.1, blue: 0.2)
    static let squareBackground = Color.white.opacity(0.1)
    static let squareBackgroundHighlight = Color.white.opacity(0.2)
    static let playerXColor = Color.blue
    static let playerOColor = Color.pink
    static let winningSquareColor = Color.green
    
    // Animations
    static let symbolScale: CGFloat = 0.7
    static let winningAnimationDuration: Double = 0.6
    static let tapAnimationDuration: Double = 0.3
}
