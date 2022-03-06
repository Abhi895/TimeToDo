//
//  HobbiesViewController.swift
//  Time To Do
//
//  Created by Abhi Reddy on 23/07/2021.
//

import UIKit
import PaddingLabel

class HobbiesViewController: UIViewController {
    
    @IBOutlet weak var whatAreYourHobbiesLabel: UILabel!
    @IBOutlet weak var hobbiesTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var hobbiesView: UIView!
    
    var name: String = ""
    var hobbyNum = 1
    var hobby: UILabel = UILabel()
    var hobbyArray: [PaddingLabel] = [PaddingLabel()]
    var buttonArray: [UIButton] = [UIButton()]
    var buttonIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hobbiesTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        whatAreYourHobbiesLabel.text = "Hi \(name), what are your hobbies?"
        continueButton.setUp()
        hobbiesTextField.setUp()
        hobbiesView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @IBAction func addHobbyPressed(_ sender: UIButton) {
        
        if let hobbyName = hobbiesTextField.text {
            
            if hobbyName.count >= 20 {
                self.presentAlert(title: "Too Many Characters", message: "The maximam amount of characters you can enter is 20")
            } else if hobbiesTextField.text?.count == 0 {
                self.presentAlert(title: "Please enter a hobby", message: "Please enter one of your hobbies")
            } else {
                if hobbyNum <= 10 {
                    addHobby(text: hobbyName, textLength: hobbyName.count, hobbyNum: self.hobbyNum)
                    hobbyNum += 1
                } else {
                    self.presentAlert(title: "Maximum Reached", message: "You can only enter a maximum of 10 hobbies")
                }
            }
        }
        
        hobbiesTextField.text = ""
        hobbiesTextField.resignFirstResponder()
        
    }
    
    @IBAction func continuePressed(_ sender: UIButton) {
        
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        hobbiesTextField.resignFirstResponder()
    }
    
    
}
    


extension HobbiesViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    

}

extension UIViewController {
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}


