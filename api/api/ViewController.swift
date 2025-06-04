//
//  ViewController.swift
//  api
//
//  Created by HTS-MAC on 04/02/25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    var postData: [userModel] = []

   
    //task.resume()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load called")
        fetchPost()

        // Do any additional setup after loading the view.
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
                
                do{
                    let decoder = JSONDecoder()
                    let userPostModel = try decoder.decode([userModel].self, from: data)
                    
                    print("userPostModel : \(userPostModel)")
                    
                    
                }catch{
                    print("decoding got error : \(error.localizedDescription)")
                }
            }
        }.resume()
        
    }
}
struct userModel: Decodable{
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
