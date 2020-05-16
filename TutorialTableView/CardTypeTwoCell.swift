//
//  CardTypeTwoCell.swift
//  TutorialTableView
//
//  Created by Daniel Wijono on 16/05/20.
//  Copyright © 2020 Daniel Wijono. All rights reserved.
//

import UIKit

class CardTypeTwoCell: UITableViewCell {

    @IBOutlet weak var cardTypeTwoLabel: UILabel!
    @IBOutlet weak var cardTypeTwoSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
