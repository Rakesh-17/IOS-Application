//
//  CollectionViewCell.swift
//  api
//
//  Created by HTS-MAC on 10/02/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageview.contentMode = .scaleAspectFit
    }

}
