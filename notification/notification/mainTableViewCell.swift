//
//  mainTableViewCell.swift
//  notification
//
//  Created by HTS-MAC on 27/02/25.
//

import UIKit

class mainTableViewCell: UITableViewCell {

    @IBOutlet weak var detailedlabel: UILabel!
    @IBOutlet weak var normallabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
