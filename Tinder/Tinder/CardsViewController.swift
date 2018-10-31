//
//  CardsViewController.swift
//  Tinder
//
//  Created by user144731 on 10/30/18.
//  Copyright © 2018 rbradley. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    var divisor: CGFloat!
   
    
    @IBOutlet weak var guyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width/2)/0.61
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didTapPan(_:)))
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        guyImageView.isUserInteractionEnabled = true
        guyImageView.addGestureRecognizer(panGestureRecognizer)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapPan(_ sender: UIPanGestureRecognizer)
    {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        let xFromCenter = guyImageView.center.x - view.center.x
        
        guyImageView.transform = CGAffineTransform(rotationAngle: (xFromCenter/divisor))
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = guyImageView.center
            
        } else if sender.state == .changed {
            print("Gesture is changing")
            if(location.y > cardInitialCenter.y)
            {
                guyImageView.transform = CGAffineTransform(rotationAngle: (-xFromCenter)/divisor)
                
            guyImageView.center = CGPoint(x: cardInitialCenter.x+translation.x,y:cardInitialCenter.y)
            }
            else {
                guyImageView.transform = CGAffineTransform(rotationAngle: (xFromCenter)/divisor)
                
                guyImageView.center = CGPoint(x: cardInitialCenter.x+translation.x,y:cardInitialCenter.y)
            }
        } else if sender.state == .ended {
            if (guyImageView.center.x < 75){
                UIView.animate(withDuration: 0.3, animations: {
                    self.guyImageView.alpha = 0
                    self.guyImageView.center = CGPoint(x: self.guyImageView.center.x - 150, y: self.guyImageView.center.y)
                }){(Bool) in
                    self.reset()
                }
                return
            }
            else if (guyImageView.center.x > (view.frame.width - 75)) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.guyImageView.alpha = 0
                    self.guyImageView.center = CGPoint(x: self.guyImageView.center.x + 150, y: self.guyImageView.center.y)
                }){(Bool) in
                    self.reset()
                }
                return
                //resetCard()
            }
            
            print("Gesture ended")
            reset()
        }
    }
    
    func reset()
    {
        self.guyImageView.transform = CGAffineTransform.identity
        self.guyImageView.center = self.view.center
        self.guyImageView.alpha = 1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "profileSegue"){
            let dvc = segue.destination as! ProfileViewController
            dvc.passedImage = guyImageView.image
        }
    }
    @IBAction func didTapGuy(_ sender: UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
