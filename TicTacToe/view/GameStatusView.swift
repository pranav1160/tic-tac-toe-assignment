//
//  GameStatusView.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import SwiftUI

struct GameStatusView: View {
    let winner: Player?
    let isDraw: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            if let winner = winner {
                Text("🎉 Player \(winner.rawValue) Wins! 🎉")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(winnerColor)
                    .multilineTextAlignment(.center)
            } else if isDraw {
                Text("It's a Draw!")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.1))
        )
        .scaleEffect(winner != nil || isDraw ? 1.0 : 0.8)
        .opacity(winner != nil || isDraw ? 1.0 : 0.0)
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: winner)
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: isDraw)
    }
    
    private var winnerColor: Color {
        guard let winner = winner else { return .white }
        return winner == .x ? Constants.playerXColor : Constants.playerOColor
    }
}