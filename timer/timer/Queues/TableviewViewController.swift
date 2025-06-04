//
//  TableviewViewController.swift
//  timer
//
//  Created by HTS-MAC on 02/04/25.
//

import UIKit
import SwiftyJSON

class TableviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var postData: [UserDataModel] = []
    private var timer: Timer?
    private var counter = 0
    let Global = DispatchQueue.global(qos: .background)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Table View"
        
        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
       // tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        print("view did load called")
        fetchPost()
        startTimer()
        downloadImage()
        print(postData)
        // Constraints for the table view
        
    }
    
    // Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{ return UITableViewCell() }
        let post = postData[indexPath.row]
        cell.configure(with: post)

      //  cell.celllabel.text = post.title
        return cell
    }
   
    
    private func startTimer() {
        // Invalidate previous timer if exists
        timer?.invalidate()
        
        // Create new timer that repeats every 10 seconds
        timer = Timer.scheduledTimer(
            timeInterval: 10.0,
            target: self,
            selector: #selector(timerFired),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func timerFired() {
        counter += 1
        print("Reloading Image for \(counter) times at \(Date())")
        downloadImage()
    }
    private func downloadImage() {
        guard let url = URL(string: "https://picsum.photos/200/300") else {
            print("Invalid URL")
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Server error")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                Global.async { DispatchQueue.main.async {
                    self.imageview.image = image
                    
               } }

              /*  DispatchQueue.global(qos: .userInteractive).async {
                  //  Perform time-critical task here, such as updating the UI
                  DispatchQueue.main.async {
                        self.imageviewd.image = image
                   }
               )*/
                
                
            }
        }
        
        task.resume()
    }
    deinit {
        timer?.invalidate()
    }
    
    
    func fetchPost(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
            print("invalid Url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print("error occuring on post fetching : \(error.localizedDescription)")
                return
            }
            if let response = response as? HTTPURLResponse{ // 200
                print("the status code is : \(response.statusCode)")
            }
            if let data = data{
                print("data fetched : \(data)")
                
                let json_data = JSON(data)
                
                var post_data: [UserDataModel] = []
                
                for json in json_data.arrayValue{
                    post_data.append(UserDataModel(json: json))
                }
                
                print("post_data count : \(post_data.count)")
                print("post_data : \(post_data)")
                
                self.postData = post_data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
        }.resume()
        
    }
}


struct UserDataModel{
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(json: JSON){
        self.userId = json["userId"].intValue
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.body = json["body"].stringValue
    }
}


