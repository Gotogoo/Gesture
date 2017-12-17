//
//  RotationViewController.swift
//  GestureDemo
//
//  Created by Facheng Liang  on 16/12/2017.
//  Copyright © 2017 Facheng Liang . All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
    private let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Rotation"
        
        imageView.image = UIImage(cgImage: #imageLiteral(resourceName: "cat") .cgImage!)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        imageView.center = view.center
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(responseToRotationGesture))
        imageView.isUserInteractionEnabled = true
        view.addGestureRecognizer(rotation)
    }
    
    @objc func responseToRotationGesture(_ rotation: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: rotation.rotation)
        rotation.rotation = 0
    }

}
