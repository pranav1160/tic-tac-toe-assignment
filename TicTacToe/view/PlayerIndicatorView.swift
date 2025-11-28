//
//  PlayerIndicatorView.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import SwiftUI

struct PlayerIndicatorView: View {
    let currentPlayer: Player
    
    var body: some View {
        HStack(spacing: 12) {
            Text("Current Player:")
                .font(.headline)
                .foregroundColor(.white.opacity(0.8))
            
            Text(currentPlayer.rawValue)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(playerColor)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(playerColor.opacity(0.2))
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.1))
        )
    }
    
    private var playerColor: Color {
        currentPlayer == .x ? Constants.playerXColor : Constants.playerOColor
    }
}