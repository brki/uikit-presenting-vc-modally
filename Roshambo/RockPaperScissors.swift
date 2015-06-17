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
    Returns a string that represents the game outcome, e.g. one of
     - "tie"
     - "rock-paper"
     - "rock-scissors"
     - "paper-scissors"
    */
    func resultForOptions(#byPlayer: RockPaperScissors, byComputer: RockPaperScissors) -> String {
        return resultMap[Set([byPlayer, byComputer])]!
    }
}
