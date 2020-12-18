//
//  ViewController.swift
//  ScreenEdgePanGesture
//
//  Created by Hamza Mustafa on 18/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var footballImage: UIImageView!
    var screenEdgeGesture = UIScreenEdgePanGestureRecognizer()
    var currentRadius : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(screenEdgeGesture)
        screenEdgeGesture.addTarget(self, action: #selector(rotateFootball))
        screenEdgeGesture.edges = .left
    }

    @objc func rotateFootball() {
        if screenEdgeGesture.state == .ended {
            if self.currentRadius == 360.0 {
                self.currentRadius = 0.0
            }
            
            UIView.animate(withDuration: 0.5) {
                self.currentRadius += 90.0
                self.footballImage.transform = CGAffineTransform(rotationAngle: (self.currentRadius * CGFloat(Double.pi)) / 180.0)
            }
        }
    }
}
