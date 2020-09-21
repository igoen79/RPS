//
//  GameState.swift
//  RPS
//
//  Created by Hendro Goenawan on 9/19/20.
//

import Foundation
import UIKit

enum GameState {
    case Start, Win, Lose, Draw
    var state: String {
        switch self {
        case .Start: return "Start"
        case .Win: return "Win"
        case .Lose: return "Lose"
        case .Draw: return "Draw"
        }
    }
    var color: UIColor {
        switch self {
        case .Start: return UIColor.white
        case .Win: return UIColor.green
        case .Lose: return UIColor.red
        case .Draw: return UIColor.blue
        }
    }
}
