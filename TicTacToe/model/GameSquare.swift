//
//  GameSquare.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import Foundation

struct GameSquare: Identifiable {
    let id: Int
    var player: Player?
    
    init(id: Int, player: Player? = nil) {
        self.id = id
        self.player = player
    }
}