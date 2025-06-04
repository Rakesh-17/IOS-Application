//
//  ViewController.swift
//  collectionviewanimation
//
//  Created by HTS-MAC on 20/01/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    let animations: [String] = ["heart", "heart", "heart", "heart", "heart","heart"]

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: UICollectionViewFlowLayout())
        collectionview.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width)
        collectionview.layer.borderColor = UIColor.black.cgColor
        collectionview.layer.borderWidth = 2.0
        collectionview.layer.cornerRadius = 10.0
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        //Add To Parent View
        view.addSubview(collectionview!)
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        animations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
               let animationName = animations[indexPath.item]
               cell.configure(with: animationName)


               return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 400)}
    

}
