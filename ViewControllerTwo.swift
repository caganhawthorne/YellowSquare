//
//  ViewControllerTwo.swift
//  Timer Game
//
//  Created by caganhawthorne on 7/3/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
   
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    var timer = NSTimer()
    var counter = 0
    var images : [UIImageView]!
    var points = 0
    var randomNumber = Int(arc4random_uniform(9))
    
    @IBOutlet weak var counterLabel: UILabel!
    
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
        counter++
        counterLabel.text = String(counter)
        if counter == 30{
            performSegueWithIdentifier("gameOver", sender: nil)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewControllerThree
        dvc.finalPoints = String(points)
        
    }
    
    @IBAction func screenWasTapped(sender: UITapGestureRecognizer) {
        for image in images {
            if(CGRectContainsPoint(image.frame, sender.locationInView(backGroundView)) && (image.image == UIImage(named: "yellow"))) {
                
                    points++
                
            }
        
            else if(CGRectContainsPoint(image.frame, sender.locationInView(backGroundView)) && (image.image == UIImage(named: "red"))) {
                
                points--
                
            }

        }
        pointsLabel.text = String(points)
        
        for image in images {
            image.image = UIImage(named:"red")
        }
            
        randomNumber = Int(arc4random_uniform(9))
        images[randomNumber].image = UIImage(named: "yellow")
    
    }
    
    
    
    
    
    
    


}
