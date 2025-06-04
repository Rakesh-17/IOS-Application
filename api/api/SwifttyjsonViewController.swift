//
//  SwifttyjsonViewController.swift
//  api
//
//  Created by HTS-MAC on 06/02/25.
//

import UIKit
import SwiftyJSON

class SwifttyjsonViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var postData: [UserDataModel] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Table View"
        
        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        print("view did load called")
        fetchPost()
        print(postData)
        // Constraints for the table view
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{ return UITableViewCell() }
        let post = postData[indexPath.row]
      //  cell.celllabel.text = post.title
        return cell
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

