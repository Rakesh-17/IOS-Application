//
//  CollectionViewCell.swift
//  test
//
//  Created by HTS-MAC on 28/05/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with title1: String, title: String) {
       // imageView.image = UIImage(named: imageName)
        date.text = title1
        day.text = title
        print(title)
        //backgroundColor = color
    }
}
