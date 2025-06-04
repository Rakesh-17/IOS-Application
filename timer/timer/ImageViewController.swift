//
//  ImageViewController.swift
//  timer
//
//  Created by HTS-MAC on 26/03/25.
//

import UIKit
import SwiftyJSON


class ImageViewController: UIViewController {
    
    @IBOutlet weak var labeltext: UILabel!
    @IBOutlet weak var imageviewd: UIImageView!
    
    private var timer: Timer?
    private var counter = 0
    var postData: [UserDataModel] = []
    let customQueue = DispatchQueue(label: "com.example.concurrentqueue", attributes: .concurrent)
    let Global = DispatchQueue.global(qos: .background)
    private var posts: [JSON] = []
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPosts()
        
        startTimer()
        
        downloadImage()
    }
    private func fetchPosts() {
           
           guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
               labeltext.text = "Invalid URL"
               return
           }
           
           let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
               DispatchQueue.main.async {
                   
                   if let error = error {
                       self?.labeltext.text = "Error: \(error.localizedDescription)"
                       return
                   }
                   
                   guard let data = data else {
                       self?.labeltext.text = "No data received"
                       return
                   }
                   
                   do {
                       let json = try JSON(data: data)
                       self?.posts = json.array ?? []
                       self?.startDisplayingTitles()
                   } catch {
                       self?.labeltext.text = "JSON parsing error: \(error.localizedDescription)"
                   }
               }
           }
           
           task.resume()
       }
       
       private func startDisplayingTitles() {
           guard !posts.isEmpty else {
               labeltext.text = "No posts available"
               return
           }
           
           // Display first title immediately
           displayTitle(at: 0)
           
           // Set up timer to rotate titles every 10 seconds
           timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { [weak self] _ in
               self?.rotateToNextTitle()
           }
       }
       
       private func rotateToNextTitle() {
           currentIndex = (currentIndex + 1) % posts.count
           displayTitle(at: currentIndex)
       }
       
       private func displayTitle(at index: Int) {
           guard index < posts.count else { return }
           
           let post = posts[index]
         customQueue.async {
             DispatchQueue.main.async {
                 self.labeltext.text = post["title"].string
              }
           }
       //    labeltext.text = post["title"].string
           
           
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
                    self.imageviewd.image = image
                    
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
    
    
}

