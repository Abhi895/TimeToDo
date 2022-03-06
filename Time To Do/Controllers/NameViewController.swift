//
//  NameViewController.swift
//  Time To Do
//
//  Created by Abhi Reddy on 22/07/2021.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.setUp()
        nextButton.setUp()
        nameTextField.delegate = self
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0

        }
        
        self.performSegue(withIdentifier: "nameToHobbies", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nameToHobbies" {
            if let destinationVC = segue.destination as? HobbiesViewController {
                if let name = nameTextField.text {
                    if name.count >= 20 {
                        self.presentAlert(title: "Too Many Characters", message: "The maximam amount of characters you can enter is 20")
                    } else if name.count == 0 {
                        self.presentAlert(title: "No Name Entered", message: "Please Enter Your Name")
                    } else {
                        destinationVC.name = name
                        
                    }
                }
            }
        }
    }
}
    

extension NameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setUp() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setLeftPaddingPoints(10)
        
    }
}


extension UIButton {
    func setUp() {
        self.titleLabel?.font = UIFont(name: "Inter-Bold", size: 17)
        self.clipsToBounds = true
        self.layer.cornerRadius = 25
    }
}
