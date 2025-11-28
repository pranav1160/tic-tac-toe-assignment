//
//  ContentView.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            // Background
            Constants.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Title
                Text("Tic-Tac-Toe")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                // Game Status or Player Indicator
                if viewModel.gameOver {
                    GameStatusView(winner: viewModel.winner, isDraw: viewModel.isDraw)
                } else {
                    PlayerIndicatorView(currentPlayer: viewModel.currentPlayer)
                }
                
                // Game Grid
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: Constants.gridSpacing),
                                   count: Constants.gridSize),
                    spacing: Constants.gridSpacing
                ) {
                    ForEach(viewModel.squares) { square in
                        GameSquareView(
                            square: square,
                            isWinning: viewModel.winningIndices.contains(square.id),
                            onTap: {
                                viewModel.makeMove(at: square.id)
                            }
                        )
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding()
                
                // Restart Button
                RestartButtonView {
                    withAnimation {
                        viewModel.resetGame()
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
