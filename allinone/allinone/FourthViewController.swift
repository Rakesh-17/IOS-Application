//
//  FourthViewController.swift
//  allinone
//
//  Created by HTS-MAC on 23/01/25.
//

import UIKit

class FourthViewController: UIViewController {

    private let essayText: String = """
        
              
        
        
        
                  Animals

        Animals play a crucial role in our ecosystem and our lives. They come in various shapes, sizes, and species, each contributing uniquely to the environment. From the tiniest insects to the largest mammals, animals help maintain ecological balance. For instance, bees are essential for pollination, which supports plant growth and food production. Predators like lions and wolves help control the population of other species, ensuring a balanced food chain.

        Domesticated animals, such as dogs and cats, provide companionship and emotional support to humans. They have been our partners in various tasks, from hunting to herding livestock. Farm animals like cows, chickens, and sheep are vital for agriculture, providing us with food, clothing, and other resources.

        Wildlife also has significant cultural and economic importance. Many communities rely on animals for their livelihoods, through activities like fishing, hunting, and tourism. Additionally, animals have inspired art, literature, and folklore across different cultures.

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
            
            view.backgroundColor = .red
            essayLabel.text = essayText
            view.addSubview(essayLabel)
            
            NSLayoutConstraint.activate([
                essayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                essayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                essayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                essayLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
        }
    
    @IBAction func back(_ sender: Any) {
        present(ViewController(), animated: true)

    }
}

