//
//  ViewController.swift
//  RPS
//
//  Created by Hendro Goenawan on 9/19/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var state = GameState.Start
    var robotSign = Sign.paper
    var userSign = Sign.paper
    var start: Bool = true
    
    func updateElement() {
        if !start {
            robotSign = randomSign()
            playerLabel.text = robotSign.emoji
    
            rockButton.isHidden = userSign != .rock
            paperButton.isHidden = userSign != .paper
            scissorsButton.isHidden = userSign != .scissor
            
            switch userSign {
            case .rock:
                switch robotSign {
                case .rock:
                    state = .Draw
                case .paper:
                    state = .Lose
                case .scissor:
                    state = .Win
                }
            case .paper:
                switch robotSign {
                case .rock:
                    state = .Win
                case .paper:
                    state = .Draw
                case .scissor:
                    state = .Lose
                }
            case .scissor:
                switch robotSign {
                case .rock:
                    state = .Lose
                case .paper:
                    state = .Win
                case .scissor:
                    state = .Draw
                }
            }
            
            playButton.isHidden = state == .Start
            
        } else {
            playerLabel.text = "🤖"
            playButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
        }
        
        stateLabel.text = state.state
        view.backgroundColor = state.color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateElement()
        start = false
    }

    @IBAction func rockTapped(_ sender: UIButton) {
        userSign = Sign.rock
        updateElement()
    }
    
    @IBAction func paperTapped(_ sender: UIButton) {
        userSign = Sign.paper
        updateElement()
    }
    
    @IBAction func scissorsTapped(_ sender: UIButton) {
        userSign = Sign.scissor
        updateElement()
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        start = true
        state = .Start
        updateElement()
        start = false
    }
}

