//
//  TableViewCell.swift
//  timer
//
//  Created by HTS-MAC on 02/04/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var detailedLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(detailedLabel)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with post: UserDataModel) {
        detailedLabel.text = post.title
    }
    
}




    
    
   

