//
//  HobbyCell.swift
//  Time To Do
//
//  Created by Abhi Reddy on 10/12/2022.
//

import UIKit

class HobbyCell: UITableViewCell {

    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftView.layer.cornerRadius = 19
        rightView.layer.cornerRadius = 19
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }
    
}
