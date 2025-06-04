//
//  FifthViewController.swift
//  fresh
//
//  Created by HTS-MAC on 31/01/25.
//

import UIKit

class FifthViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var pages: [UIViewController] = [PageoneViewController(), PagetwoViewController(),PagethreeViewController()]
    
        
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
           
           self.navigationController?.isNavigationBarHidden = true
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



