//
//  TableCell.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 16.05.2022.
//

import UIKit

struct Contact {
    var name: String
    var address: String
}

class TableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    //MARK: - Public
    func configure(_ contact: Contact) {
        nameLabel.text = contact.name
        addressLabel.text = contact.address
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
