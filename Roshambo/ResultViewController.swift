//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Brian King on 17/06/15.
//  Copyright (c) 2015 Brian King. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    var resultText: String?
    var won: Bool?

    override func viewWillAppear(animated: Bool) {
        if let result = resultText {
            resultImageView.image = UIImage(named: result)

            resultLabel.text = messageForResult(result, won: self.won)
        }
    }

    func messageForResult(result: String, won: Bool?) -> String {
        var message: String
        switch result {
        case "rock-paper":
            message = "Paper covers rock"
        case "rock-scissors":
            message = "Rock crushes scissors"
        case "paper-scissors":
            message = "Scissors cut paper"
        default:
            message = "It's a tie."
        }

        if let didWin = won {
            message += didWin ? " - You win!" : " - You lose."
        }
        return message
    }

    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
