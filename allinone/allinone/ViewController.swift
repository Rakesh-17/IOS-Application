//
//  ViewController.swift
//  allinone
//
//  Created by HTS-MAC on 23/01/25.
//

import UIKit

class ViewController: UIViewController {
        
        
        var pickerView  = UIPickerView()
        var presentButton = UIButton()
        
         let presentationStyles: [UIModalPresentationStyle] = [ .fullScreen, .pageSheet, .formSheet, .overFullScreen, .popover]
         let transitionStyles: [UIModalTransitionStyle] = [ .coverVertical, .flipHorizontal, .crossDissolve]
         var selectedPresentationStyle: UIModalPresentationStyle = .fullScreen
         var selectedTransitionStyle: UIModalTransitionStyle = .coverVertical

        override func viewDidLoad()
            {
            navigationController?.isNavigationBarHidden = true
            view.backgroundColor = .lightGray
            setupPickerView()
            setupPresentButton()
        }
        
        func setupPickerView() {
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            pickerView.layer.borderWidth = 1.0
            pickerView.layer.borderColor = UIColor.darkGray.cgColor
            pickerView.layer.cornerRadius = 10
            pickerView.clipsToBounds = true
            view.addSubview(pickerView)
        NSLayoutConstraint.activate([
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor), pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50), pickerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8), pickerView.heightAnchor.constraint(equalToConstant: 200)
        ])
            
        }
        
        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title: String = component == 0 ? presentationStyleTitle(for: presentationStyles[row]) : transitionStyleTitle(for: transitionStyles[row])
        let attributes: [NSAttributedString.Key: Any] = [ .font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black
        ]
        return NSAttributedString(string: title, attributes: attributes) }
        

        func setupPresentButton() {
       
        presentButton.setTitle("Present Next Page", for: .normal)
        presentButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        presentButton.backgroundColor = .blue
        presentButton.setTitleColor(.white, for: .normal)
        presentButton.layer.cornerRadius = 10
        presentButton.addTarget(self, action: #selector(presentNextPage), for: .touchUpInside)
            
        presentButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(presentButton)
        NSLayoutConstraint.activate([
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), presentButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20), presentButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7), presentButton.heightAnchor.constraint(equalToConstant: 50)
        ]) }
        
        @objc  func presentNextPage() {
            let nextVC = NextViewController()
          
     
        nextVC.modalTransitionStyle = selectedTransitionStyle
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
        
    }
        

     func presentationStyleTitle(for style: UIModalPresentationStyle) -> String
    { switch style {
    case .fullScreen: return "Full Screen"
    case .pageSheet: return "Page Sheet"
    case .formSheet: return "Form Sheet"
    case .overFullScreen: return "Over Full Screen" case .popover: return "Popover"
    default: return "Unknown"
    }
    }
     func transitionStyleTitle(for style: UIModalTransitionStyle) -> String { switch style {
    case .coverVertical: return "Cover Vertical"
    case .flipHorizontal: return "Flip Horizontal"
    case .crossDissolve: return "Cross Dissolve" default: return "Unknown"
    }
    }




    }
