//
//  CollectionViewCell.swift
//  collectionviewanimation
//
//  Created by HTS-MAC on 20/01/25.
//

import UIKit
import Lottie

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionviewcellview: LottieAnimationView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 8.0
    }
    func configure(with animationName: String) {
           
        collectionviewcellview.backgroundColor = .white
        collectionviewcellview.animation = LottieAnimation.named(animationName)
      
      //  collectionviewcellview.frame = view.bounds
      
      
        collectionviewcellview.contentMode = .scaleAspectFit
      
      // 4. Set animation loop mode
      
        collectionviewcellview.loopMode = .loop
      
      
        collectionviewcellview.animationSpeed = 0.5
      
      //  view.addSubview(collectionviewcellview)
      
        collectionviewcellview.play()
       }
}
