//
//  Player.swift
//  TicTacToe
//
//  Created by Pranav on 29/11/25.
//


import Foundation

enum Player: String {
    case x = "X"
    case o = "O"
    
    var name: String {
        rawValue
    }
    
    mutating func toggle() {
        self = (self == .x) ? .o : .x
    }
    
    func next() -> Player {
        return (self == .x) ? .o : .x
    }
}