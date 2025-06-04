//
//  pageViewController.swift
//  allinone
//
//  Created by HTS-MAC on 23/01/25.
//

import UIKit

class pageViewController: UIPageViewController, UIPageViewControllerDataSource{
    var pageViewController: UIPageViewController!
    var pages: [UIViewController] = [FirstViewController(), SecondViewController(), ThirdViewController(),FourthViewController()]
    
        
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Initialize the Page View Controller
           pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
           pageViewController.dataSource = self
           
           // Set the initial view controller
           if let firstViewController = pages.first {
               pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
           }
           
           // Add the Page View Controller as a child view controller
           addChild(pageViewController)
           view.addSubview(pageViewController.view)
           pageViewController.didMove(toParent: self)
           
           // Set constraints for the Page View Controller's view
           pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
               pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
               pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
           ])
           
       }
       
       // MARK: - UIPageViewControllerDataSource Methods
       
    @objc(pageViewController:viewControllerBeforeViewController:) func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
           guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
               return nil
           }
           return pages[currentIndex - 1]
       }
       
    @objc(pageViewController:viewControllerAfterViewController:) func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < (pages.count - 1) else {
               return nil
           }
           return pages[currentIndex + 1]
       }
    
   }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

