//
//  PinchViewController.swift
//  GestureDemo
//
//  Created by Facheng Liang  on 16/12/2017.
//  Copyright © 2017 Facheng Liang . All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {
    private let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    private var originalScale: CGFloat! = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Pinch"
        
        imageView.image = UIImage(cgImage: #imageLiteral(resourceName: "cat") .cgImage!)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        imageView.center = view.center
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(responseToPinchGesture))
        imageView.isUserInteractionEnabled = true
        view.addGestureRecognizer(pinch)
    }
    
    @objc func responseToPinchGesture(_ pinch: UIPinchGestureRecognizer) {
    
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        originalScale = originalScale * pinch.scale
        pinch.scale = 1
        
        if pinch.state == UIGestureRecognizerState.ended {
            if originalScale > 4 {
                originalScale = 4
            } else if originalScale < 0.25 {
                originalScale = 0.25
            }
            UIView.animate(withDuration: 0.3, animations: { [unowned self] in
                self.imageView.transform = CGAffineTransform(scaleX: self.originalScale, y: self.originalScale)
            })
        }
    }

}
