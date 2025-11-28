//
//  GameSquareView.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import SwiftUI

struct GameSquareView: View {
    let square: GameSquare
    let isWinning: Bool
    let onTap: () -> Void
    
    @State private var showSymbol = false
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: Constants.squareCornerRadius)
                    .fill(backgroundColor)
                    .shadow(color: isWinning ? Constants.winningSquareColor.opacity(0.6) : .clear,
                            radius: isWinning ? 10 : 0)
                
                if let player = square.player {
                    Text(player.rawValue)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(playerColor(for: player))
                        .scaleEffect(showSymbol ? 1.0 : 0.5)
                        .opacity(showSymbol ? 1.0 : 0.0)
                }
            }
        }
        .buttonStyle(SquareButtonStyle(isWinning: isWinning))
        .onChange(of: square.player, initial: false) { oldValue, newValue in
            if newValue != nil {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    showSymbol = true
                }
            } else {
                showSymbol = false
            }
        }


    }
    
    private var backgroundColor: Color {
        isWinning ? Constants.winningSquareColor.opacity(0.3) : Constants.squareBackground
    }
    
    private func playerColor(for player: Player) -> Color {
        player == .x ? Constants.playerXColor : Constants.playerOColor
    }
}

struct SquareButtonStyle: ButtonStyle {
    let isWinning: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
