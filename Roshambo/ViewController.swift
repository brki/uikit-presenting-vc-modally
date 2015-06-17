//
//  ViewController.swift
//  Roshambo
//
//  Created by Brian King on 15/06/15.
//  Copyright (c) 2015 Brian King. All rights reserved.
//

import UIKit

/**
For each of the rock, paper, and scissors buttons, this ViewController and
associated Storyboard use a different way of presenting the ResultViewController
modally.
 - rock: "manually" (without storyboard segue)
 - paper: code initiates storyboard segue, prepareForSegue sets destination VC property
 - scissors: storyboard defines that button initiates segue, prepareForSegue sets destination VC property.
*/
class ViewController: UIViewController {

    let RPS = RockPaperScissorsModel()

    /**
    Fetches results controller from storyboard, sets result from playing with Rock,
    and presents results controller modally.
    */
    @IBAction func rock(sender: UIButton) {
        let controller =  self.storyboard?.instantiateViewControllerWithIdentifier("results") as! ResultViewController
        setResultForPlay(RockPaperScissors.Rock, controller: controller)
        self.presentViewController(controller, animated: true, completion: nil)
    }

    /**
    Initiates ``paper`` segue.
    */
    @IBAction func paper(sender: UIButton) {
        self.performSegueWithIdentifier("paper", sender: self)
    }

    /**
    Calls setResultForPlay() with appropriate object for ``paper`` and ``scissors``
    segues.
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var playWith: RockPaperScissors?
        if segue.identifier == "paper" {
            playWith = RockPaperScissors.Paper
        } else if segue.identifier == "scissors" {
            playWith = RockPaperScissors.Scissors
        }
        if let with = playWith {
            let controller = segue.destinationViewController as! ResultViewController
            setResultForPlay(with, controller: controller)
        }
    }

    /**
    Sets the ResultViewController's resultImage text and won boolean with the result of
    playRockPaperScissor(with).
    */
    func setResultForPlay(with: RockPaperScissors, controller: ResultViewController) {
        let (result, won) = playRockPaperScissor(with)
        controller.resultText = result
        controller.won = won
    }

    /**
    Returns a tuple (``result``, ``playerWon``).

    ``result`` is a string that represents the game outcome.
    ``playerWon`` is a Bool indicating if player won.
    */
    func playRockPaperScissor(with: RockPaperScissors) -> (String, Bool?) {
        return RPS.resultForOptions(
            byPlayer: with,
            byComputer: RPS.randomOption()
        )
    }
}