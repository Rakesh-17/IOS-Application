//
//  PagethreeViewController.swift
//  fresh
//
//  Created by HTS-MAC on 31/01/25.
//

import UIKit

class PagethreeViewController: UIViewController {

    private let essayText: String = """
                      
                
                          Fishs

           Fish are fascinating creatures that inhabit diverse aquatic environments,from freshwater rivers to deep ocean trenches. They come in various shapes, sizes, and colors, making them a vibrant part of the underwater world. Fish play a crucial role in maintaining ecological balance by controlling algae growth and providing food for other species. Many fish have specialized adaptations, like gills for breathing underwater and streamlined bodies for efficient swimming. They are an important source of protein for humans and have significant cultural and economic value.  🐟🌊 

        """
        
        private let essayLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont(name: "Outfit-Black", size: 20)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            essayLabel.text = essayText
            view.addSubview(essayLabel)
            
            self.navigationController?.isNavigationBarHidden = true
            
            NSLayoutConstraint.activate([
                essayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                essayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                essayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                essayLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
        }
    
   
    

}
