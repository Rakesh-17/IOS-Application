//
//  SearialViewController.swift
//  timer
//
//  Created by HTS-MAC on 01/04/25.
//

import UIKit

class SearialViewController: UIViewController {
    
    // 1. Create a concurrent queue
    let concurrentQueue = DispatchQueue(label: "com.example.concurrentqueue", attributes: .concurrent)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple

        // Do any additional setup after loading the view.
        setupQueue()
    }
    
    // 2. Task function with random delay
    func performTask(_ number: Int) {
        Swift.print("⏳ Task \(number) started")
        Thread.sleep(forTimeInterval: 3)
        Swift.print("✅ Task \(number) completed")
    }
    
    func setupQueue(){
        DispatchQueue.global(qos: .background).async {
            
        }
        // 3. Demo concurrent execution
        concurrentQueue.async { self.performTask(1) }
        concurrentQueue.async { self.performTask(2) }
        concurrentQueue.async { self.performTask(3) }
        
        // 4. Sync vs Async
//        print("\n=== ASYNC EXAMPLE ===")
//        print("Before async tasks")
//        concurrentQueue.async { self.performTask(4) }
//        concurrentQueue.async { self.performTask(5) }
//        print("After async tasks")
//        
//        print("\n=== SYNC EXAMPLE ===")
//        print("Before sync tasks")
        concurrentQueue.sync { performTask(6) }
        concurrentQueue.sync { performTask(7) }
//        print("After sync tasks")
//        
//        // Keep playground running
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//            print("\nAll tasks finished!")
//        }
    }
}
