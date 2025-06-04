//
//  TableViewCell.swift
//  api
//
//  Created by HTS-MAC on 05/02/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var detailedlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(detailedlabel)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
