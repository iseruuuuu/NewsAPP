//
//  IntroViewController.swift
//  AnimeNews
//
//  Created by 井関竜太郎 on 2021/01/04.
//

import UIKit
import Lottie

class IntroViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var onboardArray = ["1","2","3","4"]
    
    var onboardStringArray = ["ゲームや！","アニメなど！","あなたの好きなものを！","自分専用にできる！"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        setUpScroll()
        
        for i in 0...3 {
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //ナビゲーションを消す
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpScroll() {
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 6, height: scrollView.frame.size.height)
        
        for i in 0...3 {
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: view.frame.size.height/3,width: scrollView.frame.size.width, height: scrollView.frame.size.width))
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
            
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

}
