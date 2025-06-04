//
//  secondViewController.swift
//  test
//
//  Created by HTS-MAC on 28/05/25.
//

import UIKit

protocol BlurVCDelegate: AnyObject {
   func removeBlurView()
}
class secondViewController: UIViewController {
    weak var delegate: BlurVCDelegate?
    
    @IBOutlet weak var tapView: UIView!
    var onSave: ((Task) -> Void)?

    let nameField = UITextField()
       let descriptionField = UITextField()
       let modeSegment = UISegmentedControl(items: ["Work", "Personal", "Other"])
       let addButton = UIButton(type: .system)

       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           setupUI()
           let tapToDismiss = UITapGestureRecognizer(target: self, action:#selector(tapToDismiss(_:)))
           tapView.addGestureRecognizer(tapToDismiss)

       }
    @objc func tapToDismiss(_ recognizer: UITapGestureRecognizer) {
        
        delegate?.removeBlurView()
        dismiss(animated: true, completion: nil)
        }

       func setupUI() {
           nameField.placeholder = "Task Name"
           nameField.borderStyle = .roundedRect

           descriptionField.placeholder = "Task Description"
           descriptionField.borderStyle = .roundedRect

           modeSegment.selectedSegmentIndex = 0

           addButton.setTitle("Add Task", for: .normal)
           addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

           let stack = UIStackView(arrangedSubviews: [nameField, descriptionField, modeSegment, addButton])
           stack.axis = .vertical
           stack.spacing = 15
           stack.translatesAutoresizingMaskIntoConstraints = false

           view.addSubview(stack)
           NSLayoutConstraint.activate([
               stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
           ])
       }

       @objc func addButtonTapped() {
           guard let name = nameField.text, !name.isEmpty,
                 let description = descriptionField.text, !description.isEmpty else {
               return
           }

           let selectedMode = modeSegment.titleForSegment(at: modeSegment.selectedSegmentIndex) ?? "Unknown"
           let task = Task(name: name, description: description, mode: selectedMode)
           onSave?(task)
           //navigationController?.popViewController(animated: true)

           let secondVC = ViewController()
         //  secondVC.taskToDisplay = task
           present(secondVC, animated: true)
           print(task)
           secondVC.setuptableView1()
           //secondVC.displayTask()
           print("done")
       }

    }
