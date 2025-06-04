//
//  ViewController.swift
//  test
//
//  Created by HTS-MAC on 28/05/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, BlurVCDelegate{
   
    
    
    func removeBlurView() {
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }

    @IBOutlet weak var tableview: UITableView!
  //  @IBOutlet weak var vstack: UIStackView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var collectionviewa: UICollectionView!
    @IBOutlet weak var monthbt: UIButton!
    
   // var taskToDisplay: Task?
    private var tasks: [Task] = []

    let cellData2 = [
           (title1: "1", title: "Pay"),
           (title1: "2", title: "Bazaar"),
           (title1: "3", title: "mxplayer"),
           (title1: "4", title: "Health"),(title1: "1", title: "Pay"),
           (title1: "2", title: "Bazaar"),
           (title1: "3", title: "mxplayer"),
           (title1: "4", title: "Health")
       ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView1()
        setuptableView1()

      //  displayTask()
        // Do any additional setup after loading the view.
    }
    @IBAction func blurBtnPressed(_ sender: Any) {
            
        let blurVC = secondViewController()
            
            blurVC.modalPresentationStyle = .custom
        
            present(blurVC, animated: true, completion: nil)
            setBlurView()
        
        blurVC.delegate = self
        }
    func setBlurView() {
        
        let blurView = UIVisualEffectView()
        
        blurView.frame = view.frame
        
        blurView.effect = UIBlurEffect(style: .regular)
        
        view.addSubview(blurView)
        
    }
    @IBAction func optionselected(_ sender: UIAction) {
        self.monthbt.setTitle(sender.title, for:.normal)
    }
    private func setupCollectionView1() {
            // Create a vertical flow layout
            let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 0
            
            // Calculate cell size (full width, 1/4 of view height minus spacing)
            let cellHeight = (view.frame.height - 80) / 2
            layout.itemSize = CGSize(width: view.frame.width - 40, height: cellHeight)
            layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            
            // Initialize collection view
           // collectionview1 = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
          //  collectionview1.backgroundColor = .systemBackground
        collectionviewa.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionviewa.dataSource = self
        collectionviewa.delegate = self
        view.addSubview(view3)
      /*  view3.addSubview(view4)
        view4.addSubview(view5)
        view5.addSubview(collectionview3)*/
            
            // Add constraints
           
        }
     func setuptableView1() {
            // Create a vertical flow layout
            
        tableview.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = .none
        tableview.backgroundColor = .clear
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 120
        tableview.translatesAutoresizingMaskIntoConstraints = false
               // return tableview
           
        }
    
    @objc private func addTaskTapped() {
        let addTaskVC = secondViewController()
          addTaskVC.onSave = { [weak self] task in
              self?.addNewTask(task)
          }
          navigationController?.pushViewController(addTaskVC, animated: true)
      }
      
      private func addNewTask(_ task: Task) {
          tasks.insert(task, at: 0) // Add to beginning of array
          let indexPath = IndexPath(row: 0, section: 0)
          tableview.insertRows(at: [indexPath], with: .automatic)
      }
  }

  extension ViewController: UITableViewDataSource {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return tasks.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(
              withIdentifier: TableViewCell.identifier,
              for: indexPath
          ) as! TableViewCell
          
          cell.configure(with: tasks[indexPath.row])
          return cell
      }
  }

  extension ViewController: UITableViewDelegate {
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
          print("Selected task: \(tasks[indexPath.row].name)")
      }
      
      func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
          let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completion) in
              self?.tasks.remove(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .automatic)
              completion(true)
          }
          
          return UISwipeActionsConfiguration(actions: [deleteAction])
      }
  }
struct Task {
    let name: String
    let description: String
    let mode: String // Could be an enum in a real app
   // let dateCreated: Date
    
    init(name: String, description: String, mode: String) {
        self.name = name
        self.description = description
        self.mode = mode
      //  self.dateCreated = Date()
    }
}



// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return cellData2.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionviewa.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            let data = cellData2[indexPath.item]
        cell.configure(with: data.title1, title: data.title)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
          
            return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
       
           
                let totalSpacing = 10 * 2 + 10 * (2 - 1) // sectionInsets.left + right + minimumInteritemSpacing * (itemsPerRow - 1)
        let itemsPerRow: CGFloat = CGFloat(cellData2.count)
                let width = (collectionviewa.bounds.width - CGFloat(totalSpacing)) / itemsPerRow
                return CGSize(width: width, height: width) // Square cells
                            
                  
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 5 // Horizontal spacing between cells
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5) // Adjust as needed
       }
    }


