//
//  HighScore.swift
//  Timer Game
//
//  Created by caganhawthorne on 7/3/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import Foundation

class HighScore {
    init() {
    }
    
    var highScore = 0
    
    func updateScore(score: Int) {
        highScore = score
    }
    
    
}

var highScoreObject = HighScore()
