//
//  Sign.swift
//  RPS
//
//  Created by Hendro Goenawan on 9/19/20.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum Sign {
    case rock, paper, scissor
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "🖐"
        case .scissor: return "✌️"
        }
    }
}

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissor
    }
}
