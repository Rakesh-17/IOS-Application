//
//  CollectionViewController.swift
//  api
//
//  Created by HTS-MAC on 10/02/25.
//

import UIKit
import Foundation
import SwiftyJSON
import Alamofire
import SDWebImage

class CollectionViewController: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    var images: [Photos] = []
    var refreshControl = UIRefreshControl()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
 // Number of items in the collection view
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{ return UICollectionViewCell() }
        let photo = images[indexPath.row]
        //cell.imageview.image = UIImage(named: "blur")
        cell.imageview.sd_setImage(with: URL(string: photo.src.original), placeholderImage: nil)
        print("src original  : \(photo.src.original)")
        //cell.detailedlabel?.text = "Name: \(user.name) \n Email id : \(user.email) \n Phone no:\(user.phone) )"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2
        return CGSize(width: (width - 10) , height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let selectedImageName = images[indexPath.item]
        
        if((indexPath.row%2) == 0){
            let detailVC = DetailViewController()
            detailVC.imageName = selectedImageName.src.original
            detailVC.rownumber = indexPath.row
            navigationController?.pushViewController(detailVC, animated: true)}
        else{
            let detailVC = DetailViewController()
            detailVC.imageName = selectedImageName.src.original
            detailVC.rownumber = indexPath.row
            navigationController?.present(detailVC, animated: true)
        }
    }
   
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        print("view did load called")
        loadImagesFromJSON { [weak self] in
            self?.collectionView.reloadData()
        }
        // Add refresh control to the collection view
        collectionView.refreshControl = refreshControl
                
        // Configure the refresh control
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
    }
    @objc func refreshData() {
           // Perform your data refresh logic here
           DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               // Stop the refresh control
               self.refreshControl.endRefreshing()
               
               // Reload the collection view data
               self.collectionView.reloadData()
               self.navigationController?.setNavigationBarHidden(true, animated: true)
               
           }
       }
    
    func loadImagesFromJSON (completion: @escaping () -> Void) {
        let posturl = "https://run.mocky.io/v3/31977183-b352-4183-a339-85c2ad1400cf"
        
        
        
        //let params: Parameters = ["email": "test@gmail.com", "passkey": "123456"]
        AF.request(posturl, method: .post, parameters: nil).validate().response { response in
            switch response.result{
            case .success(let successData):
                if let data = successData{
                    print("successData : \(data)")
                    
                
                     let jsonData = JSON(data)
                     print("jsonData: \(jsonData)")
                                  
                    let post_data = products(json: jsonData)
                    
                    
                    print("post_data page : \(post_data.page)")
                    print("post_data images : \(post_data.photos.count)")
                    self.images = post_data.photos
                    
                    self.collectionView.reloadData()
                  //  print("post_data : \(post_data)")
                    
                   // self.images =
                }
            case .failure(let failure):
                print("network error : \(failure.localizedDescription)")
            }
        }
    }
}
   

   // MARK: - UICollectionViewDelegate
   extension ViewController: UICollectionViewDelegate {
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           print("Selected item at index: \(indexPath.item)")
       }
   }

struct products{
    let page: Int
    let per_page: Int
    let photos: [Photos]
    
    init(json: JSON){
       
        self.page = json["page"].intValue
        self.per_page = json["per_page"].intValue
        self.photos = json["photos"].arrayValue.map{ Photos(json: $0) }
    }
}




struct Photos {
    
    let id: Int
    let width: Int
    let height: Int
    let photographer_id: Int
    let liked: Bool
    let url: String
    let photographer_url: String
    let photographer: String
    let avg_color: String
    let src: Src
    let alt: String


init(json: JSON){
    self.id = json["id"].intValue
    self.height = json["height"].intValue
    self.width = json["width"].intValue
    self.photographer_id = json["photographer_id"].intValue
    self.url = json["url"].stringValue
    self.photographer_url = json["photographer_url"].stringValue
    self.photographer = json["photographer"].stringValue
    self.avg_color = json["avg_color"].stringValue
    self.alt = json["alt"].stringValue
    self.liked = json["liked"].boolValue
    self.src = Src(json: json["src"])

}
}

struct Src{
    let original: String
    let large2x: String
    let large: String
    let medium: String
    let small: String
    let portrait: String
    let landscape: String
    let tiny: String

    
    init(json: JSON){
        self.original = json["original"].stringValue
        self.large2x = json["large2x"].stringValue
        self.large = json["large"].stringValue
        self.medium = json["medium"].stringValue
        self.small = json["small"].stringValue
        self.landscape = json["landscape"].stringValue
        self.portrait = json["portrait"].stringValue
        self.tiny = json["tiny"].stringValue

        
    }
}

//https://run.mocky.io/v3/31977183-b352-4183-a339-85c2ad1400cf
