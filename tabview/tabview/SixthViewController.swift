//
//  SixthViewController.swift
//  tabview
//
//  Created by HTS-MAC on 17/01/25.
//

import UIKit
import Lottie

class SixthViewController: UIViewController {

    
   // private var animationView: LottieAnimationView?

    @IBOutlet weak var smilebut: UIButton!
    @IBOutlet weak var heartbut: UIButton!
    @IBOutlet weak var aniview: LottieAnimationView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(smilebut)
        view.addSubview(heartbut)
        view.addSubview(aniview)
    }
    

    @IBAction func smileact(_ sender: Any) {
        // 2. Start LottieAnimationView with animation name (without extension)
        
          aniview.animation = LottieAnimation.named("smile")
        
          aniview.frame = view.bounds
        
        // 3. Set animation content mode
        
        aniview.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        
        aniview.loopMode = .loop
        
        // 5. Adjust animation speed
        
        aniview.animationSpeed = 0.5
        
        view.addSubview(aniview)
        
        // 6. Play animation
        
          aniview.play()
        
      }
    
    @IBAction func heartact(_ sender: Any) {
        // 2. Start LottieAnimationView with animation name (without extension)
        
          aniview.animation = LottieAnimation.named("heart")
        
          aniview.frame = view.bounds
        
        // 3. Set animation content mode
        
        aniview.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        
        aniview.loopMode = .loop
        
        // 5. Adjust animation speed
        
        aniview.animationSpeed = 0.5
        
        view.addSubview(aniview)
        
        // 6. Play animation
        
          aniview.play()
        
      }
    
}
