//
//  CollectionViewCell2.swift
//  amazon
//
//  Created by HTS-MAC on 08/05/25.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {

    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var imageview2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with imageName: String, title: String) {
        imageview2.image = UIImage(named: imageName)
        label2.text = title
        print(title)
        //backgroundColor = color
    }
    
}
