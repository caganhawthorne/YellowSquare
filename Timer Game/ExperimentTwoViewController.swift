//
//  ExperimentTwoViewController.swift
//  Timer Game
//
//  Created by caganhawthorne on 7/4/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class ExperimentTwoViewController: UIViewController {

    @IBOutlet weak var pointLabel: UILabel!
    var finalPoints = ""
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = finalPoints + " seconds"
        if(Int(finalPoints)! > highScoreObject.mostTime)
        {
            highScoreObject.updateMostTime(Int(finalPoints)!)
            
        }
        highScoreLabel.text = String(highScoreObject.mostTime) + " seconds"
    }


}
