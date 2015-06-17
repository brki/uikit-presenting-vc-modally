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
        let resultsController =  self.storyboard?.instantiateViewControllerWithIdentifier("results") as! ResultViewController
        resultsController.resultImage = playRockPaperScissor(RockPaperScissors.Rock)
        self.presentViewController(resultsController, animated: true, completion: nil)
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
        if segue.identifier == "paper" {
            setResultForPlay(RockPaperScissors.Paper, segue: segue)
        } else if segue.identifier == "scissors" {
            setResultForPlay(RockPaperScissors.Scissors, segue: segue)
        }
    }

    /**
    Sets the ResultViewController's resultImage text with the result of
    playRockPaperScissor(with).
    */
    func setResultForPlay(with: RockPaperScissors, segue: UIStoryboardSegue) {
        let controller = segue.destinationViewController as! ResultViewController
        controller.resultImage = playRockPaperScissor(with)
    }

    /**
    Returns a string that represents the game outcome.
    */
    func playRockPaperScissor(with: RockPaperScissors) -> String {
        return RPS.resultForOptions(
            byPlayer: with,
            byComputer: RPS.randomOption()
        )
    }

}