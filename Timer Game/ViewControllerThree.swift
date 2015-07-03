//
//  ViewControllerThree.swift
//  Timer Game
//
//  Created by caganhawthorne on 7/3/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController {

    @IBOutlet weak var pointLabel: UILabel!
    var finalPoints = ""
   
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = finalPoints
        if(Int(finalPoints)! > highScoreObject.highScore)
        {
            highScoreObject.updateScore(Int(finalPoints)!)
            
        }
        highScoreLabel.text = String(highScoreObject.highScore)
    }
    
}