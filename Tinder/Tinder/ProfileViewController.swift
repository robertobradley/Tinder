//
//  ProfileViewController.swift
//  Tinder
//
//  Created by user144731 on 10/30/18.
//  Copyright © 2018 rbradley. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    var passedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = passedImage
        // Do any additional setup after loading the view.
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
