//
//  HobbiesViewController.swift
//  Time To Do
//
//  Created by Abhi Reddy on 23/07/2021.
//

import UIKit
//import PaddingLabel

class HobbiesViewController: UIViewController {
    
    @IBOutlet weak var whatAreYourHobbiesLabel: UILabel!
    @IBOutlet weak var hobbiesTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var hobbiesView: UITableView!
    
    var name: String = ""
    var hobby: UILabel = UILabel()
    //    var hobbyArray: [PaddingLabel] = [PaddingLabel()]
    var buttonArray: [UIButton] = [UIButton()]
    var buttonIndex: Int = 0
    var hobbies: [String] = []
    var hobbyCells: [HobbyCell] = []
    var i = 0
    var indexes: [IndexPath] = []
    var indexesCreated = false
    var arr: [Int] = []



    
    override func viewDidLoad() {
        super.viewDidLoad()
        hobbiesTextField.delegate = self
        hobbiesView.dataSource = self
        hobbiesView.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        whatAreYourHobbiesLabel.text = "Hi \(name), what are your hobbies?"
        continueButton.setUp()
        hobbiesTextField.setUp()
        hobbiesView.register(UINib(nibName: "HobbyCell", bundle: nil), forCellReuseIdentifier: "hobbyCell")
    }
    
    @IBAction func addHobbyPressed(_ sender: UIButton) {
        
        var success = false
        
        if let hobbyName = hobbiesTextField.text {
            
            if hobbyName.count >= 20 {
                self.presentAlert(title: "Too Many Characters", message: "The maximam amount of characters you can enter is 20")
            } else if hobbies.contains(hobbyName) {
                    self.presentAlert(title: "Hobby already entered", message: "Please enter a different hobby")
            } else if hobbiesTextField.text?.count == 0 {
                self.presentAlert(title: "Please enter a hobby", message: "Please enter one of your hobbies")
            } else {
                if hobbies.count <= 10 {
                    hobbies.append(hobbiesTextField.text!)
                    success = true
                } else {
                    self.presentAlert(title: "Maximum Reached", message: "You can only enter a maximum of 10 hobbies")
                }
            }
        }
        
        hobbiesTextField.text = ""
        hobbiesTextField.resignFirstResponder()
        
        if hobbies.count <= 5 && success{
            arr = []
            hobbiesView.reloadData()

            let hobbyCell = hobbiesView.cellForRow(at: [0, i]) as! HobbyCell
            hobbyCells.append(hobbyCell)

            i += 1
            
            arr = []
            hobbiesView.reloadData()

            
            
        } else if success && hobbies.count <= 10 {
            
            let hobbyCell = hobbiesView.cellForRow(at: [0, i - 5]) as! HobbyCell

            
            hobbyCell.rightView.backgroundColor = UIColor(red: 0.16, green: 0.50, blue: 0.73, alpha: 1 - Double(i - 5) * 0.1)
            hobbyCell.rightLabel.text = hobbies[i]
            i += 1
        }

    }
    
    
    @IBAction func continuePressed(_ sender: UIButton) {
        if hobbies.count < 5 {
            self.presentAlert(title: "Not enough hobbies", message: "You must enter at least 5 hobbies")
        }
        
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        hobbiesTextField.resignFirstResponder()
    }
    
}
    

extension HobbiesViewController: UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hobbies.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var counter = 0
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hobbyCell", for: indexPath) as! HobbyCell
        cell.leftLabel.text = hobbies[indexPath.row]
        cell.rightView.backgroundColor = .white
        
        arr.append(hobbyCells.firstIndex(of: cell) ?? 9999999)
        
        print(arr)
        if arr.count == tableView.numberOfRows(inSection: 0) {
            if arr.contains(9999999) {
                arr.remove(at: arr.firstIndex(of: 9999999)!)
            }
            for i in arr {
                hobbyCells[i].leftView.backgroundColor = UIColor(red: 0.15, green: 0.80, blue: 0.97, alpha: 1 - Double(counter) * 0.1)
                counter += 1

            }
        }
        
        return cell
    }

    
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


