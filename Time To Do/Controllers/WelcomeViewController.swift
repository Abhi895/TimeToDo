//
//  ViewController.swift
//  Time To Do
//
//  Created by Abhi Reddy on 16/07/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getStartedButton.setUp()
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.alpha = 0.5

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0

        }
        
        performSegue(withIdentifier: "welcomeToName", sender: self)
    }
    
}



