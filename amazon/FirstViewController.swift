//
//  FirstViewController.swift
//  amazon
//
//  Created by HTS-MAC on 28/04/25.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var collectionview4: UICollectionView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var collectionview3: UICollectionView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var imageview1: UIImageView!
    let images = ["amazon11", "amazon12", "amazon13", "amazon14", "amazon15"] // Replace with your image names
    var currentIndex = 0
    var timer: Timer?
    let cellData1 = [
        (imageName: "television", title: "Keep shopping for television"),
        (imageName: "henna", title: "Keep shopping for Hennas"),
        (imageName: "Iphone 16e", title: "Keep shopping for iphone"),
        (imageName: "shoe", title: "Keep shopping for shoes")
    ]
    let cellData2 = [
        (imageName: "amzonpay", title: "Pay"),
        (imageName: "bazaar", title: "Bazaar"),
        (imageName: "mxplayer", title: "mxplayer"),
        (imageName: "health", title: "Health")
    ]
    let cellData3 = [
        (imageName: "Mobiles", title: "Mobiles"),
        (imageName: "Rewards", title: "Rewards"),
        (imageName: "Prime", title: "Prime"),
        (imageName: "Fasion", title: "Fasion"),
        (imageName: "Deals", title: "Deals"),
        (imageName: "home", title: "Home")
    ]
    let cellData4 : [UIImage] = [
        UIImage(named: "deal1")!,
        UIImage(named: "deal2")!,
        UIImage(named: "deal3")!,
        UIImage(named: "deal4")!       ]
    
    @IBOutlet weak var collectview2: UICollectionView!
    @IBOutlet weak var collectionview1: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        startSlideshow()
        setupCollectionView2()
        setupCollectionView3()
        setupCollectionView4()
        // Do any additional setup after loading the view.
    }
    func startSlideshow() {
        // Load first image
        imageview1.image = UIImage(named: images[currentIndex])
        
        // Setup timer to change image every 5 seconds
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    
    @objc func changeImage() {
        currentIndex = (currentIndex + 1) % images.count
        UIView.transition(with: imageview1,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
            self.imageview1.image = UIImage(named: self.images[self.currentIndex])
        },
                          completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    private func setupCollectionView() {
        // Create a vertical flow layout
     /*   let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 50, height: 50) */// Cell size
        //layout.itemSize = CGSize(width: 100, height: 50) // Cell size
        
        // Calculate cell size (full width, 1/4 of view height minus spacing)
        /* let cellHeight = (view.frame.height - 80) / 2
         layout.itemSize = CGSize(width: view.frame.width - 40, height: cellHeight)
         layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)*/
        
        // Initialize collection view
        //collectionview1 = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        //  collectionview1.backgroundColor = .systemBackground
        collectionview1.register(UINib(nibName: "CollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell1")
        collectionview1.dataSource = self
        collectionview1.delegate = self
        collectionview1.reloadData()

       // view.addSubview(view1)
       // view1.addSubview(collectionview1)
        
        // Add constraints
        
    }
    private func setupCollectionView2() {
        // Create a vertical flow layout
        //        let layout = UICollectionViewFlowLayout()
        
        //        layout.scrollDirection = .horizontal
        //            layout.minimumLineSpacing = 10
        //            layout.minimumInteritemSpacing = 0
        // layout.itemSize = CGSize(width: 100, height: 50) // Cell size
        
        // Calculate cell size (full width, 1/4 of view height minus spacing)
        //let cellHeight = (view.frame.height - 80) / 2
        // layout.itemSize = CGSize(width: view.frame.width - 40, height: cellHeight)
        //   l//ayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        // Initialize collection view
        // collectionview1 = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        //  collectionview1.backgroundColor = .systemBackground
        collectview2.register(UINib(nibName: "CollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell2")
        collectview2.dataSource = self
        collectview2.delegate = self
        collectview2.reloadData()
        //  view.addSubview(view3)
        /* view3.addSubview(view4)
         view4.addSubview(view2)
         view2.addSubview(collectview2)*/
        
        // Add constraints
        
    }
    private func setupCollectionView3() {
        // Create a vertical flow layout
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 50) // Cell size
        
        // Calculate cell size (full width, 1/4 of view height minus spacing)
        let cellHeight = (view.frame.height - 80) / 2
        //  layout.itemSize = CGSize(width: view.frame.width - 40, height: cellHeight)
        //   layout.itemSize = CGSize(width: cellHeight * 1.5, height: cellHeight)
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        // Initialize collection view
        // collectionview1 = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        //  collectionview1.backgroundColor = .systemBackground
        collectionview3.register(UINib(nibName: "CollectionViewCell3", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell3")
        collectionview3.dataSource = self
        collectionview3.delegate = self
        view.addSubview(view3)
        /*  view3.addSubview(view4)
         view4.addSubview(view5)
         view5.addSubview(collectionview3)*/
        
        // Add constraints
        
    }
    private func setupCollectionView4() {
        // Create a vertical flow layout
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 50) // Cell size
        
        // Calculate cell size (full width, 1/4 of view height minus spacing)
        let cellHeight = (view.frame.height - 80) / 2
        //  layout.itemSize = CGSize(width: view.frame.width - 40, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        // Initialize collection view
        // collectionview1 = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        //  collectionview1.backgroundColor = .systemBackground
        collectionview4.register(UINib(nibName: "CustomCollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell1")
        collectionview4.dataSource = self
        collectionview4.delegate = self
        view.addSubview(view3)
        /*  view3.addSubview(view4)
         view4.addSubview(view5)
         view5.addSubview(collectionview3)*/
        
        // Add constraints
        
    }
}

// MARK: - UICollectionViewDataSource
extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collectionview1)
        {
            return cellData2.count
        }
        else if(collectionView == collectview2)
        {
            return cellData1.count
        }
        else if(collectionView == collectionview3)
        {
            return cellData3.count
        }
        else {
            return cellData4.count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == collectionview1){
            let cell = collectionview1.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell1", for: indexPath) as! CollectionViewCell1
            
            let data = cellData2[indexPath.item]
            cell.configure(with: data.imageName, title: data.title)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            
            return cell
        }
        else if(collectionView == collectview2)
        {
            let cell = collectview2.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
            
            let data = cellData1[indexPath.item]
            cell.configure(with: data.imageName, title: data.title)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
//            
            return cell
        }
        else if(collectionView == collectionview3)
        {
            let cell = collectionview3.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell3", for: indexPath) as! CollectionViewCell3
            
            let data = cellData3[indexPath.item]
            cell.configure(with: data.imageName, title: data.title)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            
            return cell
        }
        else
        {
            let cell = collectionview4.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell1", for: indexPath) as! CustomCollectionViewCell1
            
            // let data = cellData4[indexPath.item]
            // cell.configure(with: data.imageName)
            cell.configure(with: cellData4[indexPath.row])
            
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /* let noOfCellsInRow = 4
         
         let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
         
         let totalSpace = flowLayout.sectionInset.left
         + flowLayout.sectionInset.right
         + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
         
         let size = Int((collectionview1.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
         print(size)
         return CGSize(width: size, height: 60)*/
        
        if(collectionView == collectionview1)
        {
          /*  let noOfCellsInRow = 4
            
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionview1.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            print(size)*/
            return CGSize(width: 5, height: 5)
            
            
            
        }
        else if(collectionView == collectview2)
        {
           // let totalSpacing: CGFloat = 20 // Adjust as needed (sum of minimumInteritemSpacing and left/right insets)
            //  let width = (375 - totalSpacing) / 4
            return CGSize(width: 5, height: 5) // Adjust height as needed
        }
        else if(collectionView == collectionview3){
            let totalSpacing: CGFloat = 20 // Adjust as needed (sum of minimumInteritemSpacing and left/right insets)
            print("This Cell calling.....")
            return CGSize(width: 40, height: self.collectionview3.frame.height)
            // let width = (375 - totalSpacing) / 4
            // return CGSize(width: width, height: 60) // Adjust height as needed
        }
        else {
            let totalSpacing: CGFloat = 20 // Adjust as needed (sum of minimumInteritemSpacing and left/right insets)
            let width = (375 - totalSpacing) / 4
            return CGSize(width: width, height: 60) // Adjust height as needed
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5 // Horizontal spacing between cells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5) // Adjust as needed
    }
}




