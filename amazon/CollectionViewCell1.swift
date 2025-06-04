//
//  CollectionViewCell1.swift
//  amazon
//
//  Created by HTS-MAC on 30/04/25.
//

import UIKit

class CollectionViewCell1: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8.0
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 5
    }
        
   /*     private func setupCell() {
            // Add corner radius and shadow
            layer.cornerRadius = 15
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.3
            layer.shadowOffset = CGSize(width: 0, height: 5)
            layer.shadowRadius = 5
            // Add subviews
            addSubview(imageView)
            addSubview(titleLabel)
            
            // Add constraints
           imageView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
           
        }
     */
        func configure(with imageName: String, title: String) {
            imageView.image = UIImage(named: imageName)
            titleLabel.text = title
            print(title)
            //backgroundColor = color
        }
    }
