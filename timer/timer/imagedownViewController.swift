//
//  imagedownViewController.swift
//  timer
//
//  Created by HTS-MAC on 26/03/25.
//

import UIKit

class imagedownViewController: UIViewController {

    private let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.backgroundColor = .lightGray
            return iv
        }()
        
        private let activityIndicator: UIActivityIndicatorView = {
            let ai = UIActivityIndicatorView(style: .large)
            ai.translatesAutoresizingMaskIntoConstraints = false
            return ai
        }()
        
        private let downloadButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Download New Image", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            downloadButton.addTarget(self, action: #selector(downloadImage), for: .touchUpInside)
            downloadImage()
        }
        
        private func setupUI() {
            view.backgroundColor = .white
            
            view.addSubview(imageView)
            view.addSubview(activityIndicator)
            view.addSubview(downloadButton)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
                imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                downloadButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
            ])
        }
        
        @objc private func downloadImage() {
            let urlString = "https://fastly.picsum.photos/id/142/200/300.jpg?hmac=B08HyXonHhJPFpULUNgMfoCFGZqymUB3NhBxo3iWTnc" // Returns random image
            
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }
            
            activityIndicator.startAnimating()
            imageView.image = nil
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
                
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
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
            
            task.resume()
        }
    }
