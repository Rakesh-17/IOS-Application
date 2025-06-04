//
//  alamofireViewController.swift
//  api
//
//  Created by HTS-MAC on 06/02/25.
//

import UIKit
import Alamofire
import Foundation
import SwiftyJSON


class alamofireViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{ return UITableViewCell() }
        let user = postData[indexPath.row]
        cell.detailedlabel?.text = "Name: \(user.name) \n Email id : \(user.email) \n Phone no:\(user.phone) )"
        
        return cell
    }
    
   
    let tableView = UITableView()
   // var users: [User] = []
    var postData: [UserDatapostMoodel] = []

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
        fetchUsers { [weak self] in
            self?.tableView.reloadData()
        }
        // Constraints for the table view
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
        
        // Table View Data Source Methods
        
        
        
        
        func fetchUsers(completion: @escaping () -> Void) {

            let posturl = "https://jsonplaceholder.typicode.com/users"
            
            
            
            //let params: Parameters = ["email": "test@gmail.com", "passkey": "123456"]
            AF.request(posturl, method: .post, parameters: nil).validate().response { response in
                switch response.result{
                case .success(let successData):
                    if let data = successData{
                        print("successData : \(data)")
                        
                        let json_data = JSON(data)
                        
                        var post_data: [UserDatapostMoodel] = []
                        
                        for json in json_data.arrayValue{
                            post_data.append(UserDatapostMoodel(json: json))
                        }
                        
                        print("post_data count : \(post_data.count)")
                        print("post_data : \(post_data)")
                        
                        self.postData = post_data
                    }
                case .failure(let failure):
                    print("network error : \(failure.localizedDescription)")
                }
            }
            
         
            
//                let url = "https://jsonplaceholder.typicode.com/users"
            
//            AF.request(url).responseDecodable(of: [User].self) { response in
//                switch response.result {
//                case .success(let users):
//                    self.users = users
//                    completion()
//                case .failure(let error):
//                    print("Error fetching users: \(error.localizedDescription)")
//                }
             }
        }
    
    
    
  /*  struct User: Codable {
        let id: Int
        let name: String
        let email: String
        let phone: String
        let company: Company
        
        struct Company: Codable {
            let name: String
        }
    }
    */
    struct UserDatapostMoodel{
        let id: Int
        let name: String
        let email: String
        let phone: String
        let company: Company
        
        init(json: JSON){
            self.name = json["name"].stringValue
            self.id = json["id"].intValue
            self.email = json["email"].stringValue
            self.phone = json["phone"].stringValue
            self.company = Company(json: json["company"])
        }
    }

    


struct Company {
    let name: String
    let catchPhrase: String
    
    init(json: JSON){
        self.name = json["name"].stringValue
        self.catchPhrase = json["catchPhrase"].stringValue
    }
}
