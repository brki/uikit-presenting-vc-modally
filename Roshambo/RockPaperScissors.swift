//
//  RockPaperScissors.swift
//  Roshambo
//
//  Created by Brian King on 15/06/15.
//  Copyright (c) 2015 Brian King. All rights reserved.
//

import Foundation

enum RockPaperScissors: Int {
    case Rock = 0, Paper = 1, Scissors = 2
}

class RockPaperScissorsModel {

    /**
    Maps a played-options set to a string result.
    */
    lazy var resultMap: Dictionary<Set<RockPaperScissors>, String> = self.initResultMap()

    let winnerMap = [
        "rock-paper": RockPaperScissors.Paper,
        "rock-scissors": RockPaperScissors.Rock,
        "paper-scissors": RockPaperScissors.Scissors,
    ]

    /**
    This clumsy-looking building of the resultMap is necessary because Swift 1.2
    fails miserably when trying to create it with a simple single declaration.
    */
    func initResultMap() -> Dictionary<Set<RockPaperScissors>, String> {
        var resultMap = Dictionary<Set<RockPaperScissors>, String>()
        resultMap[[RockPaperScissors.Rock, RockPaperScissors.Paper]] = "rock-paper"
        resultMap[[RockPaperScissors.Rock, RockPaperScissors.Scissors]] = "rock-scissors"
        resultMap[[RockPaperScissors.Paper, RockPaperScissors.Scissors]] = "paper-scissors"
        resultMap[[RockPaperScissors.Rock]] = "tie"
        resultMap[[RockPaperScissors.Paper]] = "tie"
        resultMap[[RockPaperScissors.Scissors]] = "tie"
        return resultMap
    }

    /**
     Return a random enum value from RockPaperScissors
    */
    func randomOption() -> RockPaperScissors {
        return RockPaperScissors(rawValue: Int(arc4random() % 3))!
    }

    /**
    Returns a tuple (``result``, ``playerWon``)
    ``result`` is a string that represents the game outcome, e.g. one of
         - "tie"
         - "rock-paper"
         - "rock-scissors"
         - "paper-scissors"
    ``playerWon`` is true if player won, false if player lost, and nil if it was a tie
    */
    func resultForOptions(#byPlayer: RockPaperScissors, byComputer: RockPaperScissors) -> (String, Bool?) {
        let result = resultMap[Set([byPlayer, byComputer])]!

        var playerWon: Bool?
        if let winner = winnerMap[result] {
            playerWon = winner == byPlayer
        } else {
            playerWon = nil
        }
        return (result, playerWon)
    }
}
