//
//  PagetwoViewController.swift
//  fresh
//
//  Created by HTS-MAC on 31/01/25.
//

import UIKit

class PagetwoViewController: UIViewController {

    private let essayText: String = """
        

                  Dogs

        Dogs are loyal companions and beloved pets. They offer unconditional love, companionship, and joy to millions of families around the world. Known as man's best friend, dogs have diverse roles, from family pets to working dogs in fields like search and rescue, therapy, and law enforcement. Their keen sense of smell and intelligence make them excellent assistants in various tasks. Different breeds offer unique traits and temperaments, allowing people to find the perfect match for their lifestyle. Training and socialization are crucial to ensure well-behaved dogs. Overall, dogs enrich our lives with their playful, affectionate, and protective nature. 🐶💖

        """
        
        private let essayLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont(name: "ImperialScript-Regular", size: 20)
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

