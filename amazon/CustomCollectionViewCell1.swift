//
//  CustomCollectionViewCell1.swift
//  amazon
//
//  Created by HTS-MAC on 21/05/25.
//

import UIKit

class CustomCollectionViewCell1: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with imageName: UIImage) {
        img.image =  imageName
        //backgroundColor = color
    }
}
