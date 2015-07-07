//
//  ExperimentViewController.swift
//  Timer Game
//
//  Created by caganhawthorne on 7/4/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class ExperimentViewController: UIViewController {

    @IBOutlet weak var backGroundView: UIView!
    var timer = NSTimer()
    var counter = 2
    var images : [UIImageView]!
    var points = 0
    var randomNumber = Int(arc4random_uniform(9))
  
    @IBOutlet weak var multiplierLabel: UILabel!
    
    @IBOutlet weak var image0: UIImageView!
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!

    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counter)
        images = [image0, image1, image2, image3, image4, image5, image6, image7, image8]
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        for image in images {
            image.image = UIImage(named:"red")
        }
        images[randomNumber].image = UIImage(named: "yellow")
        pointsLabel.text = String(points)
    }
    
    func updateCounter() {
        points++
        counter -= 1 + (points/20)
        pointsLabel.text = String(points)
        counterLabel.text = String(counter)
        multiplierLabel.text = "(\((points / 20)+1)x time loss)"
        if counter < 0 {
            performSegueWithIdentifier("timeRanOut", sender: nil)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ExperimentTwoViewController
        dvc.finalPoints = String(points)
        
    }
    
    @IBAction func screenWasTapped(sender: UITapGestureRecognizer) {
        for image in images {
            if(CGRectContainsPoint(image.frame, sender.locationInView(backGroundView)) && (image.image == UIImage(named: "yellow"))) {
                
                counter++
                
            }
                
            else if(CGRectContainsPoint(image.frame, sender.locationInView(backGroundView)) && (image.image == UIImage(named: "red"))) {
                
                counter-=5
                
            }
            
        }
        counterLabel.text = String(counter)
        
        for image in images {
            image.image = UIImage(named:"red")
        }
        
        randomNumber = Int(arc4random_uniform(9))
        images[randomNumber].image = UIImage(named: "yellow")
        
    }


}
