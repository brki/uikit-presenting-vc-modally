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

    var resultImage: String?

    override func viewWillAppear(animated: Bool) {
        if let img = resultImage {
            resultImageView.image = UIImage(named: img)
        }
    }

    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
